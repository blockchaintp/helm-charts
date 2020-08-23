#!groovy

// Copyright 2019 Blockchain Technology Partners
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// ------------------------------------------------------------------------------


pipeline {
  agent any

  triggers {cron('H H * * *')}


  options {
    ansiColor('xterm')
    timestamps()
    buildDiscarder(logRotator(daysToKeepStr: '31'))
  }

  environment {
    JOB_ID = sh(returnStdout: true, script: 'echo $BUILD_TAG | sha256sum | cut -c1-16').trim()
    JENKINS_UID = sh(returnStdout: true, script: 'id --user').trim()
    JENKINS_GID = sh(returnStdout: true, script: 'id --group').trim()
    DOCKER_RUN="docker run --rm -v root_${JOB_ID}:/root "
  }

  stages {

    stage('Fetch Tags') {
      steps {
        checkout([$class: 'GitSCM', branches: [[name: "${GIT_BRANCH}"]],
            doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [],
            userRemoteConfigs: [[credentialsId: 'github-credentials',noTags:false, url: "${GIT_URL}"]],
            extensions: [
                  [$class: 'CloneOption',
                  shallow: false,
                  noTags: false,
                  timeout: 60]
            ]])
      }
    }

    stage("Build Tools") {
      steps {
        sh """
          docker build -t tools:${JOB_ID} -f Dockerfile .
        """
      }
    }

// Disable this for now, GPG and helm have made incompatible choices
/*    stage("Import Keys") {
      steps {
        withCredentials([file(credentialsId: 'gpg-signing-key-asc', variable: 'GPG_KEY')]) {
          sh """
          ${DOCKER_RUN} -v \$GPG_KEY:/tmp/signing-key.asc tools:${JOB_ID} -c "export GPG_TTY=\\\$(tty) && gpg-agent --daemon && gpg --batch --import /tmp/signing-key.asc && gpg --export-secret-keys > /root/.gnupg/secring.gpg"
          """
        }
      }
    }
*/
    stage("Update dependencies and package") {
      steps {
        sh """
          src_dir=`pwd`
          cd \$src_dir/charts
          for chart in `ls`; do
            set -x
            ${DOCKER_RUN} -v \$src_dir:/project -w /project/charts tools:${JOB_ID} -c "helm dep up \$chart"
            ${DOCKER_RUN} -v \$src_dir:/project -w /project/charts tools:${JOB_ID} -c "helm package -d /project/dist/local ./\$chart"
          done
          ${DOCKER_RUN} -v \$src_dir:/project -w /project/charts tools:${JOB_ID} -c "chown -R ${JENKINS_UID}:${JENKINS_GID} /project/dist"
        """
      }
    }

    stage("Publish the charts") {
      when {
        expression { env.BRANCH_NAME == "master" }
      }
      steps {
        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding',
                    accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                    credentialsId: 'a61234f8-c9f7-49f3-b03c-f31ade1e885a',
                    secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
          script {
            def S3_TARGET="btp-charts-unstable"
            def long_version = sh(returnStdout: true, script: "git describe --long --match 'v*' |cut -c 2-").trim()
            def scm_version = sh(returnStdout: true, script: "git describe --match 'v*' |cut -c 2-").trim()
            def publish = false
            echo " ${long_version} == ${scm_version} "
            if ( long_version == scm_version ) {
              if (env.BRANCH_NAME == "master"){
                echo " === This is the master and an untagged version, using unstable repo === "
                publish = true
              }
            } else {
              echo " === This is a tagged version of the charts using stable repo === "
              S3_TARGET="btp-charts-stable"
              publish=true
            }
            if ( publish ) {
              sh """
                ${DOCKER_RUN} -v `pwd`:/project -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -w /project/dist/local \
                  tools:${JOB_ID} -c "aws s3 sync . s3://${S3_TARGET}/charts"
                ${DOCKER_RUN} -v `pwd`:/project -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -w /project/dist/remote \
                  tools:${JOB_ID} -c "aws s3 sync s3://${S3_TARGET}/charts ."
                ${DOCKER_RUN} -v `pwd`:/project -w /project/dist/remote tools:${JOB_ID} -c "helm repo index ./ --url https://${S3_TARGET}.s3.amazonaws.com/charts"
                ${DOCKER_RUN} -v `pwd`:/project -w /project/charts tools:${JOB_ID} -c "chown -R ${JENKINS_UID}:${JENKINS_GID} /project/dist"
                ${DOCKER_RUN} -v `pwd`:/project -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -w /project/dist/remote \
                  tools:${JOB_ID} -c "aws s3 cp index.yaml s3://${S3_TARGET}/charts/index.yaml"
              """
            }
          }
        }
      }
    }

  }


  post {
      cleanup {
          sh """
            docker volume rm root_${JOB_ID}
          """
      }
      aborted {
          error "Aborted, exiting now"
      }
      failure {
          error "Failed, exiting now"
      }
  }
}

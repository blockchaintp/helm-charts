#!groovy

// Copyright © 2023 Paravela Limited
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

  options {
    ansiColor('xterm')
    timestamps()
    disableConcurrentBuilds()
    buildDiscarder(logRotator(daysToKeepStr: '31'))
  }

  environment {
    ISOLATION_ID = sh(returnStdout: true, script: 'echo $BUILD_TAG | sha256sum | cut -c1-16').trim()
    JENKINS_UID = sh(returnStdout: true, script: 'id --user').trim()
    JENKINS_GID = sh(returnStdout: true, script: 'id --group').trim()
    AWS_DOCKER_RUN="docker run --rm -v root_${ISOLATION_ID}:/root "
  }

  stages {

    stage('Fetch Tags') {
      steps {
        gitConfig()
        checkoutComponent("catenasys/helm-charts", "${GIT_BRANCH}")
        dir ("shell-scripts") {
          checkoutComponent("catenasys/shell-scripts","main")
        }
      }
    }

    stage("Make documentation and checkin") {
      steps {
        sh '''
          PATH=$PATH:$(pwd)/shell-scripts/bash
          export PATH
          make docs
        '''
        updateReadmes("${GIT_BRANCH}")
      }
    }

    stage("Update dependencies") {
      steps {
        sh '''
          PATH=$PATH:$(pwd)/shell-scripts/bash
          export PATH
          make clean
          make build
        '''
      }
    }

    stage("Test") {
      steps {
        sh '''
          make test
        '''
        junit testResults: 'build/kubescape/*.xml', allowEmptyResults: true, skipMarkingBuildUnstable: true
        junit testResults: 'build/unittest/*.xml,', skipMarkingBuildUnstable: false
      }
    }

    stage("Package") {
      steps {
        sh '''
          make package
        '''
      }
    }

    stage("Analyze") {
      steps {
        sh '''
          make analyze
        '''
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
            if (env.BRANCH_NAME == "master") {
              echo " === This is the master and an untagged version, publishing to unstable repo === "
              S3_TARGET="btp-charts-unstable"
              sh """
                [ -d dist/local ] && rm -rf dist/local
                [ -d dist/remote ] && rm -rf dist/remote
                mkdir -p dist/local
                mkdir -p dist/remote
                cp dist/*.tgz dist/local
                ${AWS_DOCKER_RUN} -v `pwd`:/project -e AWS_ACCESS_KEY_ID \
                  -e AWS_SECRET_ACCESS_KEY -w /project/dist/local \
                  blockchaintp/toolchain:latest aws s3 sync . s3://${S3_TARGET}/charts
                ${AWS_DOCKER_RUN} -v `pwd`:/project -e AWS_ACCESS_KEY_ID \
                  -e AWS_SECRET_ACCESS_KEY -w /project/dist/remote \
                  blockchaintp/toolchain:latest aws s3 sync s3://${S3_TARGET}/charts .
                ${AWS_DOCKER_RUN} -v `pwd`:/project -w /project/dist/remote \
                  blockchaintp/toolchain:latest \
                  helm repo index ./ --url https://${S3_TARGET}.s3.amazonaws.com/charts
                ${AWS_DOCKER_RUN} -v `pwd`:/project \
                  -w /project/charts blockchaintp/toolchain:latest \
                  chown -R ${JENKINS_UID}:${JENKINS_GID} /project/dist
                ${AWS_DOCKER_RUN} -v `pwd`:/project -e AWS_ACCESS_KEY_ID \
                  -e AWS_SECRET_ACCESS_KEY -w /project/dist/remote \
                  blockchaintp/toolchain:latest \
                  aws s3 cp index.yaml s3://${S3_TARGET}/charts/index.yaml
              """
            }
            if ( long_version != scm_version) {
              echo " === This is a tagged version of the charts publishing to stable repo === "
              S3_TARGET="btp-charts-stable"
              sh """
                [ -d dist/local ] && rm -rf dist/local
                [ -d dist/remote ] && rm -rf dist/remote
                mkdir -p dist/local
                mkdir -p dist/remote
                cp dist/*.tgz dist/local
                ${AWS_DOCKER_RUN} -v `pwd`:/project -e AWS_ACCESS_KEY_ID \
                  -e AWS_SECRET_ACCESS_KEY -w /project/dist/local \
                  blockchaintp/toolchain:latest \
                    aws s3 sync . s3://${S3_TARGET}/charts
                ${AWS_DOCKER_RUN} -v `pwd`:/project -e AWS_ACCESS_KEY_ID \
                  -e AWS_SECRET_ACCESS_KEY -w /project/dist/remote \
                  blockchaintp/toolchain:latest \
                  aws s3 sync s3://${S3_TARGET}/charts .
                ${AWS_DOCKER_RUN} -v `pwd`:/project -w \
                  /project/dist/remote blockchaintp/toolchain:latest \
                  helm repo index ./ --url https://${S3_TARGET}.s3.amazonaws.com/charts
                ${AWS_DOCKER_RUN} -v `pwd`:/project -w /project/charts \
                  blockchaintp/toolchain:latest \
                  chown -R ${JENKINS_UID}:${JENKINS_GID} /project/dist
                ${AWS_DOCKER_RUN} -v `pwd`:/project -e AWS_ACCESS_KEY_ID \
                  -e AWS_SECRET_ACCESS_KEY -w /project/dist/remote \
                  blockchaintp/toolchain:latest \
                  aws s3 cp index.yaml s3://${S3_TARGET}/charts/index.yaml
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
            docker volume rm root_${ISOLATION_ID} || true
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

def checkoutComponent(component, tagOrBranch) {
  checkout([$class: 'GitSCM', branches: [[name: "${tagOrBranch}"]],
  doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [],
  userRemoteConfigs: [[credentialsId: 'btp-build.github', url: "https://github.com/${component}.git"]],
  extensions: [
      [$class: 'LocalBranch',
        localBranch: tagOrBranch],
      [$class: 'CloneOption',
        shallow: false,
        noTags: false,
        timeout: 60]
  ]])
}

def gitConfig() {
  sh '''
    git config --global credential.helper cache
    git config --global user.email "btp-build@blockchaintp.com"
    git config --global user.name "BTP Build"
  '''
}


def updateReadmes(branch) {
  withCredentials([usernamePassword(credentialsId: 'btp-build.github',
                                    passwordVariable: 'GIT_PASSWORD',
                                    usernameVariable: 'GIT_USERNAME')]) {
    withEnv(["branch=${branch}"]) {
      sh '''
        if [ "$branch" = "master" ]; then
          diff_readmes=$(git diff --name-only |grep README.md|wc -l)
          if [ "$diff_readmes" -gt 0 ]; then
            git add charts/*/README.md
            git add README.md
            git commit -m "ci: Updating README.md files"
            git push origin HEAD:${branch}
          fi
        fi
      '''
    }
  }
}

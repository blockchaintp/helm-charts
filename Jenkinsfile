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
    ISOLATION_ID = sh(returnStdout: true, script: 'echo $BUILD_TAG | sha256sum | cut -c1-16').trim()
    DOCKER_RUN="docker run --rm -v root_${ISOLATION_ID}:/root "
  }

  stages {

    stage("Build Tools") {
      steps {
        sh """
          docker build -t tools:${ISOLATION_ID} -f Dockerfile .
        """
      }
    }

    stage("Import Keys") {
      steps {
        withCredentials([file(credentialsId: 'gpg-signing-key-asc', variable: 'GPG_KEY')]) {
          sh """
          ${DOCKER_RUN} -v \$GPG_KEY:/tmp/signing-key.asc tools:${ISOLATION_ID} -c "gpg --import /tmp/signing-key.asc && gpg --export-secret-keys > /root/.gnupg/secring.gpg"
          """
        }
      }
    }

    stage("Update dependencies and package") {
      steps {
        sh """
          src_dir=`pwd`
          cd \$src_dir/charts
          ls
          pwd
          for chart in `ls`; do
            set -x
            ${DOCKER_RUN} -v \$src_dir:/project -w /project/charts tools:${ISOLATION_ID} -c "helm dep up \$chart"
            ${DOCKER_RUN} -v \$src_dir:/project -w /project/charts tools:${ISOLATION_ID} -c "helm package --sign \
              --key admin@blockchaintp.com --keyring /root/.gnupg/secring.gpg -d /project/dist/local ./\$chart"
          done      
        """
      }
    }

  }
    

  post {
      cleanup {
          sh """
            docker volume rm root_${ISOLATION_ID}
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

#!/usr/bin/env groovy

@Library('jenkins-shared-library') _

pipeline {
  agent {
    dockerfile {
      args  '-v /var/run/docker.sock:/var/run/docker.sock'
    }
  }
  options {
    disableConcurrentBuilds()
  }
  environment {
    VERSION = getSemver()
  }
  stages {

    stage('Checkout') {
      steps {
        checkoutWithEnv()
      }
    }

    stage('Skip?') {
      steps {
        abortIfGitTagExists env.VERSION
        abortIfNPMTagExists env.VERSION
      }
    }

    stage('Setup') {
      steps {
        sh 'npm ci'
      }
    }

    stage('Lint') {
      steps {
        sh 'npm run lint'
      }
    }

    stage('Unit') {
      steps {
        sh 'npm test'
      }
    }

    stage('SonarQube') {
      steps {
        sonarScanner env.VERSION
      }
    }

    stage('Publish') {
      steps {
        withArtifactoryNPMCredentials {
          sh "npm version ${env.VERSION} --no-git-tag-version"
          sh "npm publish --scope @appdirect --tag ${npmTag()}"
        }
      }
    }

    stage('Tag') {
      when { branch 'master' }
      steps {
        pushGitTag env.VERSION
      }
    }
  }
  post {
    always {
      slackBuildStatus '#team-need4speed-auto', env.SLACK_USER
    }
  }
}

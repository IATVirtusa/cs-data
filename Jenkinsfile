pipeline {
  agent any
  stages {
    stage('Build') {
      agent {
        node {
          label 'test_1'
        }

      }
      steps {
        build 'CS_Data_Build'
      }
    }
    stage('deploy') {
      steps {
        build 'CS_Data_Deploy'
      }
    }
    stage('End') {
      agent {
        node {
          label 'test_1'
        }

      }
      steps {
        echo 'Complete'
      }
    }
  }
}
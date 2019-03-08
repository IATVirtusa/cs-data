pipeline {
  agent any
  stages {
    stage('Build') {
      agent any
      steps {
        build 'CS_Data_Build'
      }
    }
    stage('deploy') {
      agent any
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
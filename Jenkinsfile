pipeline {
  agent any
  stages {
    stage('Build') {
      parallel {
        stage('Data Build') {
          agent any
          steps {
            build 'CS_Data_Build'
            
          }
        }
        stage('Java Build') {
          steps {
            echo 'build java'
            build 'CS_Data_HiveBuild'
          }
        }
      }
    }
    stage('Unit Tests') {
      parallel {
        stage('Unit Tests') {
          agent any
          steps {
            build 'CS_Data_HiveUnitTest'
          }
        }
        stage('Unit Test 2') {
          steps {
            echo 'running unit tests'
          }
        }
      }
    }
    stage('Code Analysis') {
      agent {
        node {
          label 'test_1'
        }

      }
      steps {
        echo 'Sonarcube'
      }
    }
    stage('Dev Deploy') {
      steps {
        build 'CS_Data_Deploy'
      }
    }
    stage('Integration Test') {
      parallel {
        stage('Integration Test') {
          steps {
            build 'CDH_TestNG'
          }
        }
        stage('Browser Tests') {
          steps {
            echo 'run tests'
          }
        }
      }
    }
    stage('artifacts') {
      steps {
        echo 'test'
      }
    }
    stage('End') {
      steps {
        echo 'end'
      }
    }
  }
}

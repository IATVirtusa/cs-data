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
        stage('Unit runs 2 (Dummy)') {
          steps {
            echo 'running unit tests'
          }
        }
      }
    }
    stage('Code Analysis(Dummy)') {
      agent {
        node {
          label 'test_1'
        }

      }
      steps {
        echo 'Sonarcube'
      }
    }
    stage('Dev/QA Deploy') {
      steps {
        build 'CS_Data_Deploy'
      }
    }
    stage('QA Tests') {
      parallel {
        stage('TestNG Tests') {
          steps {
            build 'CDH_TestNG'
          }
        }
        stage('Browser Tests(Dummy)') {
          steps {
            echo 'run tests'
          }
        }
      }
    }
    stage('artifacts') {
      steps {
        echo 'test'
         echo 'test1'
        archiveArtifacts(artifacts: '**/*.jar', fingerprint: true)
        //junit '/var/lib/jenkins/workspace/CS_Data_HiveUnitTest/hdfsutil/target/surefire-reports/*.xml'
        
      }
    }
    stage('JIRA(DUMMY)') {
      steps {
        echo 'Jira update'
      }
    }
    stage('UAT') {
      steps {
        echo 'UAT Deploy sets'
      }
    }
  }
}

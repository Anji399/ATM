pipeline {
  agent any
  stages
    {
    stage('Git checkout') {
      steps {
          git changelog: false, poll: false, url: 'https://github.com/Anji399/ATM.git'
          
      }
    }
    stage('package') {
      steps {
          sh 'mvn package'
      }    
    }
    stage('Build docker image') {
      steps {
        sh 'docker build -t mvpar/atm_machine:1.1.3 .'
      }
    }
    stage('push image') {
      steps {
        withCredentials([string(credentialsId: 'docklock', variable: 'docker')]) {
         sh "docker login -u mvpar -p ${docker}"
        } 
        sh  'docker push mvpar/atm_machine:1.1.3'
      }
    }
  }
}

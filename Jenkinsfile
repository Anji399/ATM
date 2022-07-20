pipeline {
  agent any
  stages
    {
    stage('Git checkout') {
      steps {
          git changelog: false, poll: false, url: 'https://github.com/Anji399/ATM.git'
      }
    }
    stage('Package') {
      steps {
          sh 'mvn package'
      }
    }
    stage("Build image") {
      steps {
          sh 'docker build -t 786770494633.dkr.ecr.ap-south-1.amazonaws.com/atm .'
      }
    }
    stage('push image') {
      steps {
          sh "aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 786770494633.dkr.ecr.ap-south-1.amazonaws.com"
          sh "docker push 786770494633.dkr.ecr.ap-south-1.amazonaws.com/atm" 
      }    
    }
    stage('k8s deploy') {
      steps {
          withKubeConfig(caCertificate: '', clusterName: '', contextName: '', credentialsId: 'k8s', namespace: '', serverUrl: '') {
          sh 'kubectl apply -f deploy.yml'
          }
      }
    }
  }
} 

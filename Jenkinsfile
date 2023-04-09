pipeline {
   environment {
        registry = "mihulsingh/assignmenttwo"
        registryCredential = 'Docker'
    }
   agent any

   stages {
      stage('Build') {
         steps {
            script{
               sh 'rm -rf *.war'
               sh 'jar -cvf assignment.war -C src/main/webapp/ .'
               //sh 'echo ${BUILD_TIMESTAMP}'

               docker.withRegistry('',registryCredential){
                  def customImage = docker.build("mihulsingh/assignmenttwo:1.0")
               }
            }
         }
      }

      stage('Push Image to Dockerhub') {
         steps {
            script{
               docker.withRegistry('',registryCredential){
                  sh 'docker push mihulsingh/assignmenttwo:1.0'
               }
            }
         }
      }

      stage('Deploying Rancher to single pod') {
         steps {
            script{
               sh 'kubectl set image deployment/deploymentone container-0=mihulsingh/assignmenttwo:1.0'
            }
         }
      }

      stage('Deploying Rancher as with load balancer') {
         steps {
            script{
               sh 'kubectl set image deployment/deploymentone-lb container-0=mihulsingh/assignmenttwo:1.0'
            }
         }
      }
   }
}
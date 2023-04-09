pipeline {
   environment {
        registry = "mihulsingh/assignmenttwo"
        registryCredential = 'Docker'
        TIMESTAMP = new Date().format("yyyyMMdd_HHmmss")
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
                  def customImage = docker.build("mihulsingh/assignmenttwo:${env.TIMESTAMP}")
               }
            }
         }
      }

      stage('Push Image to Dockerhub') {
         steps {
            script{
               docker.withRegistry('',registryCredential){
                  sh 'docker push mihulsingh/assignmenttwo:${env.TIMESTAMP}'
               }
            }
         }
      }

      stage('Deploying Rancher to single pod') {
         steps {
            script{
               sh 'kubectl set image deployment/load-testing container-1=mihulsingh/assignmenttwo:${env.TIMESTAMP}'
            }
         }
      }

      stage('Deploying Rancher as with load balancer') {
         steps {
            script{
               sh 'kubectl set image deployment/load-testing container-1=mihulsingh/assignmenttwo:${env.TIMESTAMP}'
            }
         }
      }
   }
}

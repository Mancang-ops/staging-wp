env.DOCKER_REGISTRY = 'pujakesuma'
env.DOCKER_IMAGE_NAME = 'staging-wp'
node('master') {
	stage('HelloWorld') {
      echo 'Hello World'
    }
    stage('Git Pull from Github') {
      git credentialsId: 'github_login', url: 'https://github.com/Mancang-ops/staging-wp.git'
    }
      stage('Build Docker Image') {
        sh "docker build --build-arg APP_NAME=production-fb -t $DOCKER_REGISTRY/$DOCKER_IMAGE_NAME:${BUILD_NUMBER} ."   
    }
      stage('Push Docker Image to Dockerhub') {
          sh "docker push $DOCKER_REGISTRY/$DOCKER_IMAGE_NAME:${BUILD_NUMBER}"
    }
      stage('DeployTo Kubernetes Cluster') {
        kubernetesDeploy(
          kubeconfigId: 'kube_config',
          configs: 'config_kubernetes_wp.yml',
          enableConfigSubstitution: true
        )
    }
    stage('Remove Docker Image') {
        sh "docker rmi $DOCKER_REGISTRY/$DOCKER_IMAGE_NAME:${BUILD_NUMBER}"   
    }
}

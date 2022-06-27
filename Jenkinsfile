node('docker') {

    stage('Checkout'){

        checkout scm

    }

    stage('Deploy'){

        docker.build "jenkins-spring:${BUILD_NUMBER}"
        docker.image("jenkins-spring:${BUILD_NUMBER}")
              .inside {

            sh """
                sh ./script/packaging.sh;
            """

	    }
    }
}

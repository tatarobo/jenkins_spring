node('docker') {

    properties([
        [$class: 'JiraProjectProperty'], [$class: 'RebuildSettings', autoRebuild: false, rebuildDisabled: false], \
	    throttleJobProperty(categories: [], limitOneJobWithMatchingParams: false, maxConcurrentPerNode: 0, maxConcurrentTotal: 0, \
				paramsToUseForLimit: '', throttleEnabled: false, throttleOption: 'project'), \
	    [$class: 'JobLocalConfiguration', changeReasonComment: ''], \
	    parameters([choice(choices: ['real-kr1', 'real-jp1', 'real-kr2', 'real-gov1'], description: '', name: 'PROFILE'), \
			choice(choices: ['ENTIRE','APPKEY'], description: '', name: 'APPLY_TARGET'), \
			string(defaultValue: '', description: 'RDS_APPKEY 입력', name: 'RDS_APPKEY', trim: false)])])

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

def buildStages = [:]

node('master') {

  withCredentials([[
      $class: 'AmazonWebServicesCredentialsBinding',
      accessKeyVariable: 'AWS_ACCESS_KEY_ID',
      secretKeyVariable: 'AWS_SECRET_ACCESS_KEY',
      credentialsId: 's3access'
  ]]) {
    buildStages = [
      'a': { stage("A") { docker.image("hashicorp/terraform:light").inside('--entrypoint=""' + " -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY") { sh 'terraform init;terraform apply -auto-approve' } } },
      'b': { stage("B") { sh 'echo B' } }
    ]
    git url: 'https://github.com/pcleddy/jenkinstest.git'
    // for (builds in [buildStages]) {
    //     parallel(builds)
    // }
    parallel(buildStages)
  }
}

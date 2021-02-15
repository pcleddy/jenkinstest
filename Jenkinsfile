def buildStages

node('master') {

  environment {
    AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
    AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
  }


  stage('Initialise') {
    buildStages = prepareBuildStages()
  }
  git url: 'https://github.com/pcleddy/jenkinstest.git'
  for (builds in buildStages) {
      parallel(builds)
  }
}

def prepareBuildStages() {
  def buildParallelMap = [:]
  def i = 1
  // for (name in [ 'one', 'two', 'three' ] ) {
  for (name in [ 'one' ] ) {
    def n = "${name} ${i}"
    buildParallelMap.put(n, prepareOneBuildStage(n))
    i = i + 1
  }
  println(buildParallelMap)
  return [buildParallelMap]
}

def prepareOneBuildStage(String name) {
  return {
    stage("Build stage:${name}") {
      docker.image("hashicorp/terraform:light").inside('--entrypoint=""') {
        sh 'terraform init;terraform plan;echo AWS: $AWS_ACCESS_KEY_ID'
        // sh 'ls'
      }
    }
  }
}

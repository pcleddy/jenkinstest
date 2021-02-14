def buildStages

node('master') {

  stage('Initialise') {
    buildStages = prepareBuildStages()
  }

  for (builds in buildStages) {
      parallel(builds)
  }
}

def prepareBuildStages() {
  def buildParallelMap = [:]
  def i = 1
  for (name in [ 'one', 'two', 'three' ] ) {
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
        // sh 'terraform init;terraform plan'
        sh 'ls'
      }
    }
  }
}

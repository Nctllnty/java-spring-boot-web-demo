def label = "slave-${UUID.randomUUID().toString()}"

podTemplate(label: label, containers: [
    containerTemplate(name: 'maven', image: 'maven', command: 'cat', ttyEnabled: true),
    containerTemplate(name: 'docker', image: 'docker:latest', command: 'cat', ttyEnabled: true),
    containerTemplate(name: 'helm', image: 'helm:latest', command: 'cat', ttyEnabled: true),
    containerTemplate(name: 'kubectl', image: 'kubectl:latest', command: 'cat', ttyEnabled: true),
    containerTemplate(name: 'sonar', image: 'sonar:latest', command: 'cat', ttyEnabled: true),
    containerTemplate(name: 'yapi', image: 'yapi:latest', command: 'cat', ttyEnabled: true)
], volumes: [
    hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock'),
    hostPathVolume(mountPath: '/home/jenkins/.kube', hostPath: '/root/.kube'),
    hostPathVolume(mountPath: '/root/.m2', hostPath: '/var/run/m2'),
]) {
node(label) {
    def myRepo = checkout scm
    def a = myRepo.GIT_BRANCH
    def b = myRepo.GIT_COMMIT
    def c = myRepo.GIT_LOCAL_BRANCH
    def d = myRepo.GIT_PREVIOUS_COMMIT
    def e = myRepo.GIT_PREVIOUS_SUCCESSFUL_COMMIT
    def f = myRepo.GIT_URL
    println(a,b,c,d,e,f)
    }
}

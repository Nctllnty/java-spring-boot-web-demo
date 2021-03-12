def label = "slave-${UUID.randomUUID().toString()}"

podTemplate(label: label, containers: [
    containerTemplate(name: 'maven', image: 'maven:3.6-alpine', command: 'cat', ttyEnabled: true)
    containerTemplate(name: 'docker', image: 'docker', command: 'cat', ttyEnabled: true)
    containerTemplate(name: 'helm', image: 'cnych/helm', command: 'cat', ttyEnabled: true)
    containerTemplate(name: 'kubectl', image: 'cnych/kubectl', command: 'cat', ttyEnabled: true)
], volumes: [
    hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock'),
    hostPathVolume(mountPath: '/home/jenkins/.kube', hostPath: '/root/.kube'),
    hostPathVolume(mountPath: '/root/.m2', hostPath: '/var/run/m2'),
]) {
node(label) {
    def myRepo = checkout scm
    def gitCommit = myRepo.GIT_COMMIT
    def getBranch - myRepo.GIT_BRANCH

    stage('单元测试') {
        echo '测试阶段' 
    }
    stage('代码打包编译') {
        container('maven')
        echo '代码打包编译阶段' 
    }
    stage('构建Docker镜像') {
        container('docker')
        echo '构建Docker镜像阶段' 
        sh 'docker info'
    }
    stage('运行Helm安装应用') {
        container('helm')
        echo '运行Helm安装应用阶段'
        sh 'helm list'
    }
    stage('探测集群
    ') {
        container('kubectl')
        echo '探测集群' 
        kubectl get node 
    }
}
}

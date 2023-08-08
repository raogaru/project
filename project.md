# project
CI/CD Pipeline using Jenkins, Terraform, AWS services, Docker, and Helm

# ################################################################################
Github Repository
https://github.com/raogaru/project.git

# clone git repo
mkdir -p $HOME/GitHub
cd $HOME/GitHub
git clone https://github.com/raogaru/project.git

# ################################################################################
# GitHub Desktop 

Reference:
https://desktop.github.com/

# ################################################################################
# Create Jenkins server

Reference: 
https://www.jenkins.io/download/lts/macos/

Install the latest LTS version: brew install jenkins-lts
Start the Jenkins service: brew services start jenkins-lts
Restart the Jenkins service: brew services restart jenkins-lts
Update the Jenkins version: brew upgrade jenkins-lts

cd $HOME/GitHub/project/vagrant/jenkins
vagrant up

-- Browse Jenkins server
http://localhost:8080
Enter admin password provided by vagrant-up command

-- Login to jenkins host 
cd $HOME/GitHub/project/vagrant/jenkins
vagrant ssh
sudo su - 

# ################################################################################
# Install Docker Desktop on Mac

Reference: 
https://docs.docker.com/desktop/install/mac-install/

Download Docker.dmg


# ################################################################################
# Install Terraform

Reference: 
https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

brew tap hashicorp/tap

brew install hashicorp/tap/terraform

brew update

brew upgrade hashicorp/tap/terraform

terraform version

# ################################################################################
# Install kubectl

# Reference: 
https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/
https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/

cd $HOME/GitHub/project/vagrant/jenkins
vagrant ssh
sudo su -

# setup yum repo
cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-\$basearch
enabled=1
gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

# verify
kubectl version


# ################################################################################
# Install Docker

Reference:
https://docs.docker.com/desktop/install/mac-install/
https://docs.docker.com/desktop/install/linux-install/
 
cd $HOME/GitHub/project/vagrant/jenkins
vagrant ssh
sudo su -

# ################################################################################
# Install Helm

Reference: 
https://helm.sh/docs/intro/install/

brew install helm




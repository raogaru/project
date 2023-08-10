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
# Create Jenkins server

cd $HOME/GitHub/project/vagrant/jenkins
vagrant up

# Browse Jenkins server
http://192.168.56.56:8080
Enter admin password provided by vagrant-up command

# Login to jenkins host 
cd $HOME/GitHub/project/vagrant/jenkins
vagrant ssh
sudo su - 

# ################################################################################
# Install Terraform

Reference: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

cd $HOME/GitHub/project/vagrant/jenkins
vagrant ssh
sudo su -

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform
terraform --version
terraform --help 

sudo su - jenkins
touch ~/.bashrc
terraform -install-autocomplete

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
# Install docker

Reference:
https://docs.docker.com/desktop/install/mac-install/
https://docs.docker.com/desktop/install/linux-install/
 
cd $HOME/GitHub/project/vagrant/jenkins
vagrant ssh
sudo su -


# ################################################################################

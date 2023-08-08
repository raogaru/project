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

brew install jenkins-lts

brew upgrade jenkins-lts

brew services start jenkins-lts

-- Browse Jenkins server

http://localhost:8080

Enter admin password provided by vagrant-up command

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

-- Reference: 

https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/

https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/

brew install kubectl

kubectl version


# ################################################################################
# Install Helm

Reference: 
https://helm.sh/docs/intro/install/

brew install helm



# ################################################################################
# Install Docker

Reference:
https://docs.docker.com/desktop/install/mac-install/
https://docs.docker.com/desktop/install/linux-install/
 

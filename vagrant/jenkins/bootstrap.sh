sudo yum update –y

sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

#sudo yum upgrade -y

sudo timedatectl set-timezone 'America/New_York'

sudo amazon-linux-extras install java-openjdk11 -y

sudo yum install java-11-amazon-corretto -y

sudo yum clean metadata

sudo yum install jenkins -y

sudo systemctl enable jenkins

sudo systemctl start jenkins

sudo systemctl status jenkins

echo "Admin password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword


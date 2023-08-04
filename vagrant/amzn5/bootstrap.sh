#sudo amazon-linux-extras list | grep nginx
sudo amazon-linux-extras enable nginx1
sudo yum clean metadata
sudo yum -y install nginx
#nginx -v
sudo systemctl enable nginx
sudo systemctl start nginx
sudo systemctl status nginx



ECHO () {
echo "$*"
}
LOG () {
echo "########################################"
echo "BOOTSTRAP: $*" >> ~/bootstrap.log
}

ECHO "set time to EST"
sudo timedatectl set-timezone 'America/New_York'

ECHO "yum update"
sudo yum update -y

ECHO "yum install jvm"
sudo yum install java -y

ECHO "adduser kafka ..."
sudo adduser kafka

ECHO "Download kafka ..."
sudo curl "https://downloads.apache.org/kafka/3.4.0/kafka_2.13-3.4.0.tgz" -o /tmp/kafka.tgz

sudo mkdir -p /opt/kafka /opt/kafka/data/kafka /opt/kafka/data/zookeeper

ECHO "Extract kafka"

sudo tar xvfz /tmp/kafka.tgz --strip 1 -C /opt/kafka


sudo echo '
export KAFKA_HOME=/opt/kafka
export PATH=$PATH:${KAFKA_HOME}/bin
set -o vi
' >> ~kafka/.bash_profile

sudo cp /tmp/kafka.service /usr/lib/systemd/system/kafka.service
sudo cp /tmp/zookeeper.service /usr/lib/systemd/system/zookeeper.service
sudo cp /tmp/server.properties /opt/kafka/config/server.properties
sudo cp /tmp/zookeeper.properties /opt/kafka/config/zookeeper.properties

sudo chown -R kafka:kafka /opt/kafka
sudo find /opt/kafka -print -exec touch -t 202301010000 {} \;

sudo systemctl daemon-reload

sudo systemctl enable kafka.service
sudo systemctl enable zookeeper.service

sudo systemctl start kafka.service
sudo systemctl start zookeeper.service

sudo systemctl status kafka.service
sudo systemctl status zookeeper.service


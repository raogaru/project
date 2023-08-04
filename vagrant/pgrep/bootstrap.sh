ECHO () {
echo "######################################################################"
echo `date`
echo "RaogaruDB PostgreSQL ..."
echo "$*"
echo "`date` $*" >> bootstrap.log
}

ECHODO () {
echo "######################################################################"
echo `date`
echo "RaogaruDB PostgreSQL ..."
echo "$*"
echo "`date` $*" >> bootstrap.log
$*
}

echo "bootstrap.sh Started !"

ECHODO "sudo timedatectl set-timezone America/New_York"

ECHODO "sudo yum update -y -q -e 0"

ECHODO "sudo yum install -y -q -e 0 bison-devel readline-devel zlib-devel openssl-devel wget ccache"

sudo yum groups install 'Development Tools' -y 

ECHODO "sudo adduser postgres"

sudo echo '
export PGCODE=$HOME/code
export PGDATA=$HOME/data
export PGSOFT=$HOME/pgsql
export PGBIN=$PGSOFT/bin
export PATH=$PATH:$PGBIN
set -o vi
' >> ~postgres/.bash_profile

sudo -u postgres bash -c 'env|grep PG'

sudo -u postgres bash -c 'mkdir -p $HOME/logs $HOME/data'

ECHO "Install pgsql from tar"
sudo -u postgres bash -c 'tar xvf /tmp/pgsql.tar'

ECHO  "initdb ..."
sudo -u postgres bash -c '$HOME/pgsql/bin/initdb -D $HOME/data'

ECHO  "start db ..."
sudo -u postgres bash -c '$HOME/pgsql/bin/pg_ctl -D $HOME/data start -l $HOME/logs/postgres.log'

ECHO  "status db ..."
sudo -u postgres bash -c '$HOME/pgsql/bin/pg_ctl -D $HOME/data status -l $HOME/logs/postgres.log'

echo "bootstrap.sh Completed !"


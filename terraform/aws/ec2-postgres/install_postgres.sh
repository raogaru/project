#!/bin/bash
# update system packages
yum update -y

# enable repository to install postgresql
amazon-linux-extras enable postgresql11

# Install PostgreSQL server and initialize the database 
# cluster for this server
yum install postgresql-server postgresql-devel -y
/usr/bin/postgresql-setup --initdb

# Backup PostgreSQL authentication config file
mv /var/lib/pgsql/data/pg_hba.conf /var/lib/pgsql/data/pg_hba.conf.bak

# Create our new PostgreSQL authentication config file
cat <<'EOF' > /var/lib/pgsql/data/pg_hba.conf
${pg_hba_file}
EOF

# Update the IPs of the address to listen from PostgreSQL config
sed -i "59i listen_addresses = '*'" /var/lib/pgsql/data/postgresql.conf

# Start the db service
systemctl enable postgresql
systemctl start postgresql

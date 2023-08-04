alter system set listen_addresses = '*';
alter system set log_connections = 'on';
alter system set log_disconnections = 'on';
alter system set log_statement = 'ddl';
alter system set log_file_mode = '0600';
alter system set log_rotation_age = '1h';
alter system set archive_mode = 'on';
alter system set xxx = 'xxx';
alter system set xxx = 'xxx';
alter system set xxx = 'xxx';
alter system set log_min_messages = 'debug5';

create database db1;
create database db2;
create database db3;

create user rao;

create user user11;
create user user12;
create user user21;
create user user22;
create user user31;
create user user32;

create role dba_role;
create role dev_role;
create role qa_role;

grant dba_role to rao;
grant dev_role to user11,user21,user31;
grant qa_role to user12,user22,user32;



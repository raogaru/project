-- databases
SELECT datname 
FROM pg_database;

-- schemas
SELECT nspname
FROM pg_namespace;

-- tablespaces\d 
SELECT spcname, spcowner
FROM pg_tablespace
ORDER BY spcname;

-- users
SELECT usename AS role_name,
 CASE
  WHEN usesuper AND usecreatedb THEN
    CAST('superuser, create database' AS pg_catalog.text)
  WHEN usesuper THEN
    CAST('superuser' AS pg_catalog.text)
  WHEN usecreatedb THEN
    CAST('create database' AS pg_catalog.text)
  ELSE
    CAST('' AS pg_catalog.text)
 END role_attributes
FROM pg_catalog.pg_user
ORDER BY role_name desc;

-- roles
SELECT rolname, rolsuper as super_user,
rolcreatedb as create_db,
rolreplication as replication,
rolinherit as inherit,
rolcreaterole as create_role
FROM pg_roles
WHERE not rolcanlogin
ORDER by rolname;


-- tables
SELECT schemaname, tableowner, tablename 
FROM pg_tables
WHERE schemaname not in ('pg_catalog','information_schema');

-- indexes
SELECT tablename, indexname, indexdef
FROM pg_indexes
WHERE schemaname not in ('pg_catalog','information_schema')
ORDER BY tablename, indexname;

-- sequences
SELECT schemaname,sequenceowner,sequencename
FROM pg_sequences
ORDER BY schemaname,sequenceowner,sequencename;

-- functions
SELECT routine_schema, routine_name 
FROM information_schema.routines 
WHERE routine_type = 'FUNCTION' 
AND routine_schema not in ('pg_catalog','information_schema');

-- procedures
SELECT routine_schema, routine_name
FROM information_schema.routines
WHERE routine_type = 'PROCEDURE'
AND routine_schema not in ('pg_catalog','information_schema');

-- types
SELECT typname, typnamespace, typowner
FROM pg_type 
ORDER BY typname;

-- extensions
SELECT extname 
FROM pg_extension;

-- processes
select pid as process_id, 
       usename as username, 
       datname as database_name, 
       client_addr as client_address, 
       application_name,
       backend_start,
       state,
       state_change
from pg_stat_activity;


-- pg_stat_statements extension
SELECT query, calls, total_exec_time, rows
,100.0*shared_blks_hit/nullif(shared_blks_hit+shared_blks_read,0) AS hit_percent
FROM pg_stat_statements 
ORDER BY total_exec_time DESC LIMIT 5;
track_activity_query_size


-- pg_buffercache extension
SELECT c.relname, count(*) AS buffers
FROM pg_buffercache b INNER JOIN pg_class c 
ON b.relfilenode = pg_relation_filenode(c.oid) AND
b.reldatabase IN (0, (SELECT oid FROM pg_database
WHERE datname = current_database()))
GROUP BY c.relname
ORDER BY 2 DESC
LIMIT 10;



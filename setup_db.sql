-- setup_db.sql
CREATE DATABASE IF NOT EXISTS dbmodel;

CREATE USER IF NOT EXISTS 'wpuser'@'%' IDENTIFIED BY 'pa+55w0rd';
GRANT ALL PRIVILEGES ON dbmodel.* TO 'wpuser'@'%';
FLUSH PRIVILEGES;
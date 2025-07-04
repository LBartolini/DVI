CREATE DATABASE IF NOT EXISTS scadalts;

/* Implicit account creation */
GRANT ALL ON scadalts.* to 'scadalts'@'%' IDENTIFIED BY 'scadalts';

FLUSH PRIVILEGES;
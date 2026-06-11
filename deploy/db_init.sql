-- Initialisation de la base CinéBase — VM2 (MariaDB)
-- À exécuter en tant que root :  mysql -u root < db_init.sql
--
-- Remplacer [IP_VM_DJANGO] par l'adresse IP de la VM1 (serveur web Django)
-- pour autoriser cette VM à se connecter à la base.

CREATE DATABASE cinebase_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE USER 'cinebase_user'@'[IP_VM_DJANGO]' IDENTIFIED BY 'motdepasseSAE';
GRANT ALL PRIVILEGES ON cinebase_db.* TO 'cinebase_user'@'[IP_VM_DJANGO]';
FLUSH PRIVILEGES;

-- Puis injecter les données du dump :
--   mysql -u root cinebase_db < sauvegarde_cinebase.sql

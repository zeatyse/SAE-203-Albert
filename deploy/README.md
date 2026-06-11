# Déploiement CinéBase sur 2 VM

Configuration des services mise en place par **Mathis** (mise en place de la base de données + serveur NGINX).

Architecture :
- **VM2** — Base de données (MariaDB)
- **VM1** — Serveur web (Django + Gunicorn + Nginx)

> Remplacer partout `[IP_VM_DJANGO]` (VM1) et `[IP_VM_SQL]` (VM2) par les vraies adresses IP.
> Procédure d'origine complète : `../config 2 vm.pdf`.

## VM2 — Base de données (MariaDB)

1. Installer MariaDB :
   ```bash
   apt update && apt install mariadb-server
   ```
2. Ouvrir l'écoute réseau — voir `mariadb/50-server.cnf` (`bind-address = 0.0.0.0`), puis :
   ```bash
   systemctl restart mariadb
   ```
3. Créer la base, l'utilisateur et les droits — voir `db_init.sql` :
   ```bash
   mysql -u root < db_init.sql
   ```
4. Injecter les données :
   ```bash
   mysql -u root cinebase_db < sauvegarde_cinebase.sql
   ```

## VM1 — Serveur web (Django + Gunicorn + Nginx)

1. Installer les outils système :
   ```bash
   apt update && apt install python3-venv python3-pip nginx default-libmysqlclient-dev pkgconfig build-essential git
   ```
2. Récupérer le code (branche Alessandro) :
   ```bash
   cd /home/toto/
   git clone -b Alessandro https://github.com/zeatyse/SAE-203-Albert.git
   cd SAE-203-Albert/banque_films
   ```
3. Configurer `banque_films/settings.py` :
   - `ALLOWED_HOSTS = ['[IP_VM_DJANGO]', 'localhost']`
   - bloc `DATABASES` → `'HOST': '[IP_VM_SQL]'`
4. Environnement Python + lancement de Gunicorn :
   ```bash
   python3 -m venv env
   source env/bin/activate
   pip install django gunicorn mysqlclient pillow
   gunicorn banque_films.wsgi:application --bind 127.0.0.1:8000 --daemon
   ```
5. Configurer Nginx — copier `nginx/cinebase.conf` vers `/etc/nginx/sites-available/cinebase`.
6. Activer le site et redémarrer Nginx :
   ```bash
   rm /etc/nginx/sites-enabled/default
   ln -s /etc/nginx/sites-available/cinebase /etc/nginx/sites-enabled/
   systemctl restart nginx
   ```

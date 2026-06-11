@echo off
echo ======================================
echo    CineBase - Lancement du serveur
echo ======================================
cd /d "%~dp0"
python manage.py runserver
pause

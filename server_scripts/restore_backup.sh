db_password=XXX
site_name=reliance.ideendevelopers.xyz
db_backup=20240608_154441-profond_ideendevelopers_xyz-database.sql.gz

cd ../
sudo docker cp server_scripts/backup/$db_backup $(sudo docker compose ps -q backend):/tmp
sudo docker compose exec backend bench --site $site_name restore /tmp/$db_backup --mariadb-root-password $db_password
sudo docker compose exec backend bench --site $site_name migrate
sudo docker compose restart backend
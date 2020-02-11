# Create a backup copy of this project database 
# @author   EfraPeralta <efra23peralta@gmail.com>
echo "Backup in progress..."
source .env && docker exec $(docker-compose ps -q db) mysqldump -u"$DB_USER" -p"$DB_PASSWORD" --databases "$DB_NAME" > "data/dumps/$DB_NAME.dump.sql"
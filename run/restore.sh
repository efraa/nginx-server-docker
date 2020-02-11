# Restoring a backup of single database
# @author   EfraPeralta <efra23peralta@gmail.com>
echo "Restoring database since last backup.."
source .env && docker exec -i $(docker-compose ps -q db) mysql -u"$DB_USER" -p"$DB_PASSWORD" < "data/dumps/$DB_NAME.dump.sql"
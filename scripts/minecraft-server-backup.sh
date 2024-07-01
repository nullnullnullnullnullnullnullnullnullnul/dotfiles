tar -zcf /mnt/drive/sv-backup/Minecraft-Server-$(date +%Y%m%d).tar.gz -C /mnt/drive/ Minecraft-Server
find /mnt/drive/sv-backup/* -mtime +1 -delete

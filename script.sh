echo '[EAGSCRIPT] grabbing Eaglercraft server + bungee'
git clone https://git.eaglercraft.rip/eaglercraft/eaglercraft-1.8-replit.git
mv eaglercraft-1.8-replit eaglercraftx
cd eaglercraftx

# delete server stuff
  rm -rf server/world
  rm -rf server/world_nether
  rm -rf server/world_the_end
  rm -rf server/logs
  rm -rf server/plugins/PluginMetrics
  rm -f server/usercache.json

# mod bungee
  rm -rf bungee/logs
  rm -f bungee/eaglercraft_skins_cache.db
  rm -f bungee/eaglercraft_auths.db
  sed -i '/^stats: /d' bungee/config.yml
  sed -i "s/^server_uuid: .*\$/server_uuid: $(cat /proc/sys/kernel/random/uuid)/" bungee/plugins/EaglercraftXBungee/settings.yml

echo '[EAGSCRIPT] grabbing the latest EaglerXBungee build'
curl -s https://git.eaglercraft.rip/eaglercraft/eaglercraft-builds/src/branch/main/EaglercraftX_1.8_EaglerXBungee.jar -o bungee/plugins/eaglerxbungee.jar 

echo '[EAGSCRIPT] completed'

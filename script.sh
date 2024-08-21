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

echo '[EAGSCRIPT] grabbing the latest EaglerXBungee build'
curl -s https://git.eaglercraft.rip/eaglercraft/eaglercraft-builds/src/branch/main/EaglercraftX_1.8_EaglerXBungee.jar -o bungee/plugins/eaglerxbungee.jar 

# processing, this is NOT replit.
echo '[EAGSCRIPT] processing eaglercraft-replit clone so its normal'
rm -rf main.sh replit.nix selsrv.sh PlaceHTTPer.class LicensePrompt.jar eula.txt buildconf*.json bindmod.so base.repl .replit misc .cache bungee/plugins/EaglercraftXBungee/ .git

echo '[EAGSCRIPT] setting up an eaglercraft client'
mkdir bungee/web
curl -s https://git.eaglercraft.rip/eaglercraft/eaglercraft-builds/src/branch/main/EaglercraftX_1.8_Web.zip -o eagweb.zip
unzip eagweb.zip -d bungee/web/
rm eagweb.zip

echo '[EAGSCRIPT] completed'

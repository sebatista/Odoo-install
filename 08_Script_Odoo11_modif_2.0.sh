#
# Libreoffice - servicio en puerto 8100 del localhost
#
sudo apt-get install libreoffice -y
sudo apt-get install libreoffice-script-provider-python -y

cat <<EOF > ~/office
### BEGIN INIT INFO
# Provides:          office
# Required-Start:    \$remote_fs \$syslog
# Required-Stop:     \$remote_fs \$syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start daemon at boot time
# Description:       Enable service provided by daemon.
### END INIT INFO
#!/bin/sh
/usr/bin/soffice --nologo --nofirststartwizard --headless --norestore --invisible "--accept=socket,host=localhost,port=8100,tcpNoDelay=1;urp;" &
EOF

sudo cp ~/office /etc/init.d/office
sudo chown root:root /etc/init.d/office
sudo chmod +x /etc/init.d/office
sudo update-rc.d office defaults
sudo /etc/init.d/office

# Verificacion del funcionamento:
# telnet localhost 8100
# Salida:
# Trying ::1...
# Trying 127.0.0.1...
# Connected to localhost.
# Escape character is '^]'. control+]
# e��'com.sun.star.bridge.XProtocolPropertiesUrpProtocolProperties.UrpProtocolPropertiesTid���$


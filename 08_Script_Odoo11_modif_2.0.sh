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

#
# Aeroo Reports
# 
sudo apt-get install default-jre -y
sudo apt-get install git -y
sudo apt-get install python3-setuptools -y
sudo apt-get install python3-uno -y
sudo apt-get install python3-lxml -y

sudo pip3 install jsonrpc2
sudo pip3 install daemonize

#
# Instalar aeroo_docs desde github oficial
#
sudo mkdir /opt/aeroo
cd /opt/aeroo
sudo mkdir /var/log/aeroo-docs

cat <<EOF > ~/aeroo-docs.conf
[start]
interface = localhost
port = 8989
oo-server = localhost
oo-port = 8100
spool-directory = /tmp/aeroo-docs
spool-expire = 1800
log-file = /var/log/aeroo-docs/aeroo_docs.log
pid-file = /tmp/aeroo-docs.pid
[simple-auth]
username = anonymous
password = anonymous
EOF

sudo cp ~/aeroo-docs.conf /etc/aeroo-docs.conf
sudo chown root:root /etc/aeroo-docs.conf
sudo git clone https://github.com/aeroo/aeroo_docs.git
yes | sudo python3 /opt/aeroo/aeroo_docs/aeroo-docs start -c /etc/aeroo-docs.conf
sudo ln -s /opt/aeroo/aeroo_docs/aeroo-docs /etc/init.d/aeroo-docs
sudo update-rc.d aeroo-docs defaults
sudo service aeroo-docs start
sudo service aeroo-docs restart




#
# Esto no se para que es.
#
sudo apt install unoconv

# Instalacion de wkhtmltox
cd /opt

sudo apt-get remove libqt4-dev
sudo apt-get remove qt4-dev-tools
sudo apt-get remove wkhtmltopdf

sudo apt-get autoremove

sudo apt-get install openssl -y
sudo apt-get install build-essential -y
sudo apt-get install libssl-dev -y
sudo apt-get install libxrender-dev -y
sudo apt-get install git-core -y
sudo apt-get install libx11-dev -y
sudo apt-get install libxext-dev -y
sudo apt-get install libfontconfig1-dev -y
sudo apt-get install libfreetype6-dev -y
sudo apt-get install fontconfig -y

sudo wget http://archive.ubuntu.com/ubuntu/pool/main/libj/libjpeg-turbo/libjpeg-turbo8_1.5.2-0ubuntu5.18.04.1_amd64.deb
sudo wget http://security.debian.org/debian-security/pool/updates/main/o/openssl/libssl1.0.0_1.0.1t-1+deb7u4_amd64.deb
sudo wget http://ftp.br.debian.org/debian/pool/main/libp/libpng/libpng12-0_1.2.50-2+deb8u3_amd64.deb
sudo wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.1/wkhtmltox-0.12.1_linux-trusty-amd64.deb

sudo dpkg -i libjpeg-turbo8_1.5.2-0ubuntu5.18.04.1_amd64.deb
sudo dpkg -i libssl1.0.0_1.0.1t-1+deb7u4_amd64.deb
sudo dpkg -i libpng12-0_1.2.50-2+deb8u3_amd64.deb
sudo dpkg -i wkhtmltox-0.12.1_linux-trusty-amd64.deb

sudo ln -s /usr/local/bin/wkhtmltopdf /usr/bin
sudo ln -s /usr/local/bin/wkhtmltoimage /usr/bin

#
# Problema de permisos en carpeta cache de pyafipws
# generalmente en /usr/local/lib/python3.5/dist-packages/pyafipws
#
sudo chown www-data -R /usr/local/lib/python3.5/dist-packages/pyafipws
sudo chmod a+xr -R /usr/local/lib/python3.5/dist-packages/pyafipws
sudo chmod a+xwrt -R /usr/local/lib/python3.5/dist-packages/pyafipws/__pycache__/

# Odoo instalado... reiniciando
# sudo su root -c "/etc/init.d/odoo-server restart"
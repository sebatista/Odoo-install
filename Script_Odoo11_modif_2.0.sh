# Script de instalacion de Odoo 11 (ADHOC)
# Servidor: Debian 9.5 (Stretch)
# Basada en recolipacion hecha por Gaston Pablo Perez

# Actualizar repositorios e instalar actaulizaciones
sudo apt-get update
sudo apt-get upgrade -y

# Instalar dependencias de python para Odoo 11
sudo apt-get install python3-pip -y
sudo apt-get install curl -y
sudo apt-get install software-properties-common -y
sudo apt-get install mc -y

sudo pip3 install --upgrade pip

# Instalar dependencias usando pip3
sudo pip3 install Babel
sudo pip3 install decorator
sudo pip3 install docutils
sudo pip3 install ebaysdk
sudo pip3 install feedparser
sudo pip3 install gevent
sudo pip3 install greenlet
sudo pip3 install html2text
sudo pip3 install Jinja2
sudo pip3 install lxml
sudo pip3 install Mako
sudo pip3 install MarkupSafe
sudo pip3 install mock
sudo pip3 install num2words
sudo pip3 install ofxparse
sudo pip3 install passlib
sudo pip3 install Pillow
sudo pip3 install psutil
sudo pip3 install psycogreen
sudo pip3 install psycopg2
sudo pip3 install pydot
sudo pip3 install pyparsing
sudo pip3 install PyPDF2
sudo pip3 install pyserial
sudo pip3 install python-dateutil
sudo pip3 install python-openid
sudo pip3 install pytz
sudo pip3 install pyusb
sudo pip3 install PyYAML
sudo pip3 install qrcode
sudo pip3 install reportlab
sudo pip3 install requests
sudo pip3 install six
sudo pip3 install suds-jurko
sudo pip3 install vatnumber 
sudo pip3 install vobject
sudo pip3 install Werkzeug
sudo pip3 install XlsxWriter
sudo pip3 install xlwt
sudo pip3 install xlrd 

# Luego de instalar Odoo me pidio esta dependencia
sudo pip3 install phonenumbers

# Instacion de dependecias para Web Odoo
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install nodejs -y
sudo apt-get install build-essential -y
sudo apt-get install gcc
sudo apt-get install g++
sudo apt-get install make
sudo npm install -g less
sudo npm install -g less-plugin-clean-css
sudo apt-get install node-less -y

# Instalacion de Postgresql 9.6
# En Debian 9.5 esta en los repositorios pero si no esta usar:
#
# sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
# wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install postgresql-9.5 -y
sudo apt-get install postgresql-client-9.5 -y
sudo apt-get install libpq5 -y
sudo apt-get install postgresql-contrib-9.5 -y
sudo apt-get install sysstat -y

# Creamos el usuario para la base de datos de Odoo
sudo su postgres -c "createuser -s odoo"

# Creamos usuario, grupo y home para odoo
sudo adduser --system --home=/opt/odoo --group odoo
sudo usermod -aG sudo odoo
sudo passwd odoo








#CORTAR EL SCRIPT PONERLO EN OTRO LADO
# Instalamos Gdata
cd /opt/odoo
sudo wget https://pypi.python.org/packages/a8/70/bd554151443fe9e89d9a934a7891aaffc63b9cb5c7d608972919a002c03c/gdata-2.0.18.tar.gz
sudo tar zxvf gdata-2.0.18.tar.gz
sudo chown -R odoo: gdata-2.0.18
sudo -s
cd gdata-2.0.18/
python setup.py install
exit
#HASTA AQUÍ






# Instalacion de odoo 11
sudo apt-get install git -y
sudo apt-get install libsasl2-dev -y
sudo apt-get install python-dev -y
sudo apt-get install libldap2-dev -y
sudo apt-get install libssl-dev -y











#CORTAR EL SCRIPT PONERLO EN OTRO LADO
sudo su - odoo -s /bin/bash
git clone --depth 1 --branch 11.0 --single-branch https://www.github.com/odoo/odoo odoo-server/
sudo pip3 install -r odoo-server/requirements.txt
sudo pip3 install -r odoo-server/doc/requirements.txt
exit





# Creamos carpeta para Log
sudo mkdir /var/log/odoo
sudo chown -R odoo:root /var/log/odoo

# Creamos el archivo de configuracion de odoo
cat <<EOF > ~/odoo-server.conf
[options]
; admin_passwd = admin
db_host = False
db_port = False
db_user = odoo
db_password = False
addons_path = /opt/odoo/odoo-server/addons,/opt/odoo/addons/account-financial-tools-11.0,/opt/odoo/addons/argentina-sale-11.0,/opt/odoo/addons/reporting-engine-11.0,/opt/odoo/addons/account-payment-11.0,/opt/odoo/addons/miscellaneous-11.0,/opt/odoo/addons/stock-11.0,/opt/odoo/addons/aeroo_reports-11.0,/opt/odoo/addons/odoo-argentina-11.0,/opt/odoo/addons/argentina-reporting-11.0,/opt/odoo/addons,
logfile = /var/log/odoo/odoo-server.log
EOF

sudo cp ~/odoo-server.conf /etc/odoo-server.conf
sudo chown odoo: /etc/odoo-server.conf
sudo chmod 640 /etc/odoo-server.conf













# SERVICIO ODOO ver 1.0
cat <<EOF > ~/odoo-server
### BEGIN INIT INFO
# Provides:             odoo-bin
# Required-Start:       \$remote_fs \$syslog
# Required-Stop:        \$remote_fs \$syslog
# Should-Start:         \$network
# Should-Stop:          \$network
# Default-Start:        2 3 4 5
# Default-Stop:         0 1 6
# Short-Description:    Enterprise Business Applications
# Description:          ODOO Business Applications
### END INIT INFO
#!/bin/sh
PATH=/bin:/sbin:/usr/bin
DAEMON=/opt/odoo/odoo-server/odoo-bin
NAME=odoo-bin
DESC=odoo-server
# Specify the user name (Default: odoo).
USER=odoo
# Specify an alternate config file (Default: /etc/odoo-server.conf).
CONFIGFILE="/etc/odoo-server.conf"
# pidfile
PIDFILE=/var/run/\${NAME}.pid
# Additional options that are passed to the Daemon.
DAEMON_OPTS="-c \$CONFIGFILE"
[ -x \$DAEMON ] || exit 0
[ -f \$CONFIGFILE ] || exit 0
checkpid() {
    [ -f \$PIDFILE ] || return 1
    pid=\`cat \$PIDFILE\`
    [ -d /proc/\$pid ] && return 0
    return 1
}
case "\${1}" in
    start)
        echo -n "Starting \${DESC}: "
        start-stop-daemon --start --quiet --pidfile \$PIDFILE --chuid \$USER --background --make-pidfile --exec \$DAEMON -- \$DAEMON_OPTS
        echo "\${NAME}."
    ;;
    stop)
        echo -n "Stopping \${DESC}: "
        start-stop-daemon --stop --quiet --pidfile \$PIDFILE --oknodo
        echo "\${NAME}."
    ;;
    restart|force-reload)
        echo -n "Restarting \${DESC}: "
        start-stop-daemon --stop --quiet --pidfile \$PIDFILE --oknodo
        sleep 1
        start-stop-daemon --start --quiet --pidfile \$PIDFILE --chuid \$USER --background --make-pidfile --exec \$DAEMON -- \$DAEMON_OPTS
        echo "\${NAME}."
    ;;
    *)
        N=/etc/init.d/\$NAME
        echo "Usage: \$NAME {start|stop|restart|force-reload}" >&2
        exit 1
    ;;
esac
exit 0
EOF

sudo cp ~/odoo-server /etc/init.d/odoo-server
sudo chmod 755 /etc/init.d/odoo-server
sudo chown root: /etc/init.d/odoo-server

# NO FUNCIONA
#sudo update-rc.d odoo-server defaults
# Arranque de Odoo 11
#sudo su root -c "/etc/init.d/odoo-server start"








# SERVICIO ODOO ver 2.0
cat <<EOF > ~/odoo-server.service
[Unit]
Description=Odoo Open Source ERP and CRM

[Service]
Type=simple
PermissionsStartOnly=true
SyslogIdentifier=odoo-server
User=odoo
Group=odoo
ExecStart=/opt/odoo/odoo-server/odoo-bin --config=/etc/odoo-server.conf
WorkingDirectory=/opt/odoo/odoo-server/

[Install]
WantedBy=multi-user.target
EOF

sudo cp ~/odoo-server.service /lib/systemd/system/
sudo chmod 755 /lib/systemd/system/odoo-server.service
sudo chown root: /lib/systemd/system/odoo-server.service

# Inicializamos
sudo systemctl start odoo-server

# Detenemos
sudo systemctl stop odoo-server

# Inicializar Automáticamente
sudo systemctl enable odoo-server.service




# Localizacion argentina ADHOC

# Crear directorios para modulos externos
sudo mkdir /opt/odoo/addons
cd /opt/odoo/addons

sudo wget https://github.com/ingadhoc/odoo-argentina/archive/11.0.zip -O ingadhoc-odoo-argentina.zip
sudo wget https://github.com/ingadhoc/account-financial-tools/archive/11.0.zip -O ingadhoc-account-financial-tools.zip
sudo wget https://github.com/ingadhoc/account-payment/archive/11.0.zip -O ingadhoc-account-payment.zip
sudo wget https://github.com/ingadhoc/aeroo_reports/archive/11.0.zip -O ingadhoc-aeroo_reports.zip
sudo wget https://github.com/ingadhoc/miscellaneous/archive/11.0.zip -O ingadhoc-miscellaneous.zip
sudo wget https://github.com/ingadhoc/argentina-reporting/archive/11.0.zip -O ingadhoc-argentina-reporting.zip
sudo wget https://github.com/ingadhoc/reporting-engine/archive/11.0.zip -O ingadhoc-reporting-engine.zip
sudo wget https://github.com/ingadhoc/argentina-sale/archive/11.0.zip -O ingadhoc-argentina-sale.zip
sudo wget https://github.com/ingadhoc/stock/archive/11.0.zip -O ingadhoc-stock.zip
sudo wget https://apps.odoo.com/loempia/download/partner_identification/11.0.1.0.0/4gXzqj52wzlBc64roBAw7v.zip -O partner_identification.zip

sudo unzip ingadhoc-odoo-argentina.zip
sudo unzip ingadhoc-account-financial-tools.zip
sudo unzip ingadhoc-account-payment.zip
sudo unzip ingadhoc-aeroo_reports.zip
sudo unzip ingadhoc-miscellaneous.zip
sudo unzip ingadhoc-argentina-reporting.zip
sudo unzip ingadhoc-reporting-engine.zip
sudo unzip ingadhoc-argentina-sale.zip
sudo unzip ingadhoc-stock.zip
sudo unzip partner_identification.zip

sudo chown -R odoo:odoo -R /opt/odoo/addons
sudo chmod -R 775 /opt/odoo/addons

sudo pip3 install pycryptodome
# original # 
# sudo pip3 install -r account-payment-11.0/requirements.txt
# sudo pip3 install -r aeroo_reports-11.0/requirements.txt
# sudo pip3 install -r argentina-reporting-11.0/requirements.txt
# sudo pip3 install -r argentina-sale-11.0/requirements.txt
# sudo pip3 install -r miscellaneous-11.0/requirements.txt
# sudo pip3 install -r odoo-argentina-11.0/requirements.txt
sudo -H pip3 install -r account-payment-11.0/requirements.txt
sudo -H pip3 install -r aeroo_reports-11.0/requirements.txt
sudo -H pip3 install -r argentina-reporting-11.0/requirements.txt
sudo -H pip3 install -r argentina-sale-11.0/requirements.txt
sudo -H pip3 install -r miscellaneous-11.0/requirements.txt
sudo -H pip3 install -r odoo-argentina-11.0/requirements.txt


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
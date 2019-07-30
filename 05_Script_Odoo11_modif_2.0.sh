
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



#
# Localizacion argentina ADHOC
#

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

sudo -H pip3 install pycryptodome
# original # 
# sudo -H pip3 install -r account-payment-11.0/requirements.txt
# sudo -H pip3 install -r aeroo_reports-11.0/requirements.txt
# sudo -H pip3 install -r argentina-reporting-11.0/requirements.txt
# sudo -H pip3 install -r argentina-sale-11.0/requirements.txt
# sudo -H pip3 install -r miscellaneous-11.0/requirements.txt
# sudo -H pip3 install -r odoo-argentina-11.0/requirements.txt
sudo -H pip3 install -r account-payment-11.0/requirements.txt
sudo -H pip3 install -r aeroo_reports-11.0/requirements.txt
sudo -H pip3 install -r argentina-reporting-11.0/requirements.txt
sudo -H pip3 install -r argentina-sale-11.0/requirements.txt
sudo -H pip3 install -r miscellaneous-11.0/requirements.txt
sudo -H pip3 install -r odoo-argentina-11.0/requirements.txt


#
# Localizacion argentina OCA
#

# Crear directorios para modulos externos
sudo mkdir /opt/odoo/addons/oca
cd /opt/odoo/addons/oca

git clone https://github.com/OCA/server-tools -b 11.0 oca-server-tools
git clone https://github.com/OCA/sale-workflow -b 11.0 oca-sale-workflow
git clone https://github.com/OCA/sale-financial -b 11.0 oca-sale-financial
git clone https://github.com/OCA/purchase-workflow -b 11.0 oca-purchase-workflow
git clone https://github.com/OCA/account-financial-tools -b 11.0 oca-account-financial-tools
git clone https://github.com/OCA/account-financial-reporting -b 11.0 oca-account-financial-reporting
git clone https://github.com/OCA/account-invoicing -b 11.0 oca-account-invoicing
git clone https://github.com/OCA/account-payment -b 11.0 oca-account-payment
git clone https://github.com/OCA/account-analytic -b 11.0 oca-account-analytic
git clone https://github.com/OCA/reporting-engine -b 11.0 oca-reporting-engine
git clone https://github.com/OCA/stock-logistics-workflow -b 11.0 oca-stock-logistics-workflow
git clone https://github.com/OCA/stock-logistics-warehouse -b 11.0 oca-stock-logistics-warehouse
git clone https://github.com/OCA/knowledge -b 11.0 oca-knowledge
git clone https://github.com/OCA/manufacture -b 11.0 oca-manufacture
git clone https://github.com/OCA/margin-analysis -b 11.0 oca-margin-analysis
git clone https://github.com/OCA/crm -b 11.0 oca-crm
git clone https://github.com/OCA/hr -b 11.0 oca-hr
git clone https://github.com/OCA/hr-timesheet -b 11.0 oca-hr-timesheet
git clone https://github.com/OCA/commission -b 11.0 oca-commission
git clone https://github.com/OCA/report-print-send -b 11.0 oca-report-print-send
git clone https://github.com/OCA/social -b 11.0 oca-social
git clone https://github.com/OCA/contract -b 11.0 oca-contract
git clone https://github.com/OCA/web -b 11.0 oca-web
git clone https://github.com/OCA/website -b 11.0 oca-website
git clone https://github.com/OCA/product-variant -b 11.0 oca-product-variant
git clone https://github.com/OCA/product-attribute -b 11.0 oca-product-attribute
git clone https://github.com/OCA/partner-contact -b 11.0 oca-partner-contact
git clone https://github.com/OCA/e-commerce -b 11.0 oca-e-commerce

sudo chown -R odoo:odoo -R /opt/odoo/addons
sudo chmod -R 775 /opt/odoo/addons

sudo -H pip3 install -r oca-server-tools/requirements.txt
pip install -r oca-sale-workflow/requirements.txt
pip install -r oca-sale-financial/requirements.txt
pip install -r oca-purchase-workflow/requirements.txt
pip install -r oca-account-financial-tools/requirements.txt
pip install -r oca-account-financial-reporting/requirements.txt
pip install -r oca-account-invoicing/requirements.txt
pip install -r oca-account-payment/requirements.txt
pip install -r oca-account-analytic/requirements.txt
pip install -r oca-reporting-engine/requirements.txt
pip install -r oca-stock-logistics-workflow/requirements.txt
pip install -r oca-stock-logistics-warehouse/requirements.txt
pip install -r oca-knowledge/requirements.txt
pip install -r oca-manufacture/requirements.txt
pip install -r oca-margin-analysis/requirements.txt
pip install -r oca-crm/requirements.txt
pip install -r oca-hr/requirements.txt
pip install -r oca-hr-timesheet/requirements.txt
pip install -r oca-commission/requirements.txt
pip install -r oca-report-print-send/requirements.txt
pip install -r oca-social/requirements.txt
pip install -r oca-contract/requirements.txt
pip install -r oca-web/requirements.txt
pip install -r oca-website/requirements.txt
pip install -r oca-product-variant/requirements.txt
pip install -r oca-product-attribute/requirements.txt
pip install -r oca-partner-contact/requirements.txt
pip install -r oca-e-commerce/requirements.txt


cd ..
mkdir others
cd others

git clone https://github.com/akretion/odoo-usability -b 11.0 others-akretion-odoo-usability
git clone https://github.com/it-projects-llc/website-addons -b 11.0 others-it-projects-llc-website-addons

pip install -r others-akretion-odoo-usability/requirements.txt
pip install -r others-it-projects-llc-website-addons/requirements.txt

sudo chown -R odoo:odoo -R /opt/odoo/addons
sudo chmod -R 775 /opt/odoo/addons

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
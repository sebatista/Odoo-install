#Instalación en Ubuntu Server 18.04
#==================================

# Notas:
# * Se instaló todo desde el usuario sise

#----------------------------------------------------------------------------------
# ========== Repositorios ==========
sudo apt-add-repository 'deb mirror://mirrors.ubuntu.com/mirrors.txt bionic main restricted universe multiverse'
sudo apt-add-repository 'deb mirror://mirrors.ubuntu.com/mirrors.txt bionic-updates main restricted universe multiverse'
sudo apt-add-repository 'deb mirror://mirrors.ubuntu.com/mirrors.txt bionic-backports main restricted universe multiverse'
sudo apt-add-repository 'deb mirror://mirrors.ubuntu.com/mirrors.txt bionic-security main restricted universe multiverse'

sudo add-apt-repository "deb http://mirrors.kernel.org/ubuntu/ bionic main"

sudo apt-add-repository 'deb http://security.ubuntu.com/ubuntu bionic-security main'

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get autoremove -y

#----------------------------------------------------------------------------------
# ========== Python 3 ==========
# python3 --version
# pip3 --version
sudo apt-get install python3 -y
sudo apt-get install python3-pip -y
sudo apt-get install python3-dev -y
sudo apt-get install python3-venv -y
sudo apt-get install python3-wheel -y
sudo apt-get install python3-setuptools -y
sudo apt-get install python3-tk -y

sudo apt-get install python3 python3-pip python3-dev python3-venv python3-wheel python3-setuptools python3-tk -y
#sudo pip install virtualenvwrapper
#source /usr/local/bin/virtualenvwrapper.sh

#sudo apt-get install python-dev -y
#sudo apt-get install python-pip -y

#----------------------------------------------------------------------------------
# ========== dependencias de development previas ==========
sudo apt-get install git -y
sudo apt-get install software-properties-common -y
sudo apt-get install libxslt-dev -y
sudo apt-get install libxslt1-dev -y
sudo apt-get install build-essential -y
sudo apt-get install libzip-dev -y
sudo apt-get install libsasl2-dev -y
sudo apt-get install node-less -y
sudo apt-get install gdebi -y
sudo apt-get install wget -y
sudo apt-get install zlib1g-dev -y
sudo apt-get install libxml2-dev -y
sudo apt-get install libffi-dev -y
sudo apt-get install libblas-dev -y
sudo apt-get install libatlas-base-dev -y
sudo apt-get install libpq-dev -y
sudo apt-get install libjpeg-dev -y
sudo apt-get install libtiff5-dev -y
sudo apt-get install libjpeg8-dev -y
sudo apt-get install libopenjp2-7-dev -y
sudo apt-get install libfreetype6-dev -y
sudo apt-get install liblcms2-dev -y
sudo apt-get install libwebp-dev -y
sudo apt-get install tcl8.6-dev -y
sudo apt-get install tk8.6-dev -y
sudo apt-get install libharfbuzz-dev -y
sudo apt-get install libfribidi-dev -y
sudo apt-get install libxcb1-dev -y
sudo apt-get install ca-certificates -y
sudo apt-get install libcups2-dev -y
sudo apt-get install libmysqlclient-dev -y
sudo apt-get install libssl-dev -y

sudo apt-get install git software-properties-common libxslt-dev libxslt1-dev build-essential libzip-dev libsasl2-dev node-less gdebi wget zlib1g-dev libxml2-dev libffi-dev libblas-dev libatlas-base-dev libpq-dev libjpeg-dev libtiff5-dev libjpeg8-dev libopenjp2-7-dev libfreetype6-dev liblcms2-dev libwebp-dev tcl8.6-dev tk8.6-dev libharfbuzz-dev libfribidi-dev libxcb1-dev ca-certificates libcups2-dev libmysqlclient-dev libssl-dev -y

#Se volvieron a instalar cuando ya había pasado
sudo apt-get install libldap2-dev -y
sudo apt-get install libmariadbclient-dev -y

sudo apt-get install npm -y
sudo npm install -g rtlcss

#----------------------------------------------------------------------------------
cd

#Descargarlo manualmente
wget http://security.ubuntu.com/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1.1_amd64.deb 
sudo apt-get install ./libpng12-0_1.2.54-1ubuntu1.1_amd64.deb
#sudo rm ./libpng12-0_1.2.54-1ubuntu1.1_amd64.deb

#Agregar repositorio
#sudo add-apt-repository ppa:linuxuprising/libpng12
#sudo apt-get update
#sudo apt-get install libpng12-0

#----------------------------------------------------------------------------------
# ========== postgresql ==========
# postgresql --version

sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

cd
wget -O psqlkey https://www.postgresql.org/media/keys/ACCC4CF8.asc
sudo apt-key add psqlkey
#sudo rm psqlkey

sudo apt-get update

sudo apt-get install postgresql-12 -y
sudo apt-get install pgadmin4 -y
sudo apt-get install pgadmin4-apache2 -y
sudo apt-get install libpq5 -y
sudo apt-get install sysstat -y
sudo apt-get install postgresql-contrib-12 -y
sudo apt-get install postgresql-client-12 -y

sudo apt-get install postgresql-12 pgadmin4 pgadmin4-apache2 libpq5 sysstat postgresql-contrib-12 postgresql-client-12 -y


#Creamos un usuario y la base de datos de Postgresql con el usuario actual
sudo su postgres -c "createuser -s odoo"
#sudo -u postgres createuser -s odoo -W
#sudo -u postgres createdb odoo

#Iniciamos sesión en postgres
sudo -u postgres psql
#Modificamos la contraseña de postgres
ALTER USER postgres PASSWORD 'password';
#Modificamos la contraseña de odoo
#ALTER USER odoo PASSWORD 'odoo';

#----------------------------------------------------------------------------------
# ========== Wkhtmltopdf ==========
# https://github.com/wkhtmltopdf/wkhtmltopdf/releases

cd

#Ubuntu 18.04 Bionic Beaver
wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.bionic_amd64.deb
sudo gdebi --n `basename https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.bionic_amd64.deb`
#sudo rm wkhtmltox_0.12.5-1.bionic_amd64.deb

# Continuar
sudo ln -s /usr/local/bin/wkhtmltopdf /usr/bin
sudo ln -s /usr/local/bin/wkhtmltoimage /usr/bin

#----------------------------------------------------------------------------------
# ========== Libre Office ==========
# Libreoffice - servicio en puerto 8100 del localhost
#sudo apt-get install libreoffice -y
#sudo apt-get install libreoffice-script-provider-python -y
sudo apt-get install libreoffice libreoffice-script-provider-python -y

#Creamos el archivo de servicio
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

#Cargamos el script de inicio para automatizarlo
sudo cp ~/office /etc/init.d/office
sudo chown root:root /etc/init.d/office
sudo chmod +x /etc/init.d/office
sudo update-rc.d office defaults
sudo /etc/init.d/office

# Verificacion del funcionamento:
telnet localhost 8100
# Salida:
# Trying ::1...
# Trying 127.0.0.1...
# Connected to localhost.
# Escape character is '^]'. control+]
# e��'com.sun.star.bridge.XProtocolPropertiesUrpProtocolProperties.UrpProtocolPropertiesTid���$


#----------------------------------------------------------------------------------
# ========== Creamos usuario, grupo y home para odoo ==========
#Creamos un nuevo usuario Odoo
sudo adduser --system --home=/opt/odoo --group odoo
sudo usermod --append --groups sudo odoo

#Cambiamos la contraseña del usuario Odoo
sudo passwd odoo

#Damos permisos de su home al usuario Odoo
sudo chown odoo: -R /opt/odoo/
#----------------------------------------------------------------------------------
# ========== Odoo ==========
# git clone https://github.com/odoo/odoo.git

sudo su - odoo -s /bin/bash
git clone --depth 1 --branch 12.0 --single-branch https://github.com/odoo/odoo.git odoo-server/

#----------------------------------------------------------------------------------
#Instalamos las dependendencias y requerimientos de Odoo.

sudo su - odoo -s /bin/bash

python3 -m pip install --user -r odoo-server/requirements.txt
python3 -m pip install --user -r odoo-server/doc/requirements.txt
#pip3 install --user -r odoo-server/requirements.txt
#pip3 install --user -r odoo-server/doc/requirements.txt

python3 -m pip install --user phonenumbers
python3 -m pip install --user keyring==12.0.0
python3 -m pip install --user keyrings.alt --upgrade

# INSTALARLO DE OTRO MODO
#python3 -m pip install --user gdata==2.0.18

#Para Aeroo Reports
python3 -m pip install --user uno
python3 -m pip install --user jsonrpc2
python3 -m pip install --user daemonize

exit

#----------------------------------------------------------------------------------

#Iniciamos sesión como odoo
#sudo su - odoo -s /bin/bash
#Para inicializar, por mas que la hayamos creado antes.
#python3 odoo-server/odoo-bin --addons-path=odoo-server/addons -d odoo -i base
#Cuando ya está inicializada
#python3 odoo-server/odoo-bin --addons-path=odoo-server/addons -d odoo

#----------------------------------------------------------------------------------
sudo mkdir /var/log/odoo
sudo chown -R odoo:root /var/log/odoo

#----------------------------------------------------------------------------------
#  ========== Creamos el archivo de configuracion de odoo ==========
cat <<EOF > ~/odoo-server.conf
[options]
; admin_passwd = admin
db_host = False
db_port = False

;Si deseamos que no pueda ver otra base de datos mas que odoo
;db_name = odoo

;Indicamos el usuario de la base de datos. Creado en PostgreSQL
db_user = odoo
;Indicamos que el usuario odoo no tiene clave, de lo contrario la cargamos aquí
db_password = False

;Indicamos donde almacenaremos el archivo de log.
logfile = /var/log/odoo/odoo-server.log

;Indicamos las carpetas de módulos addons
addons_path = /opt/odoo/odoo-server/addons,

;/opt/odoo/addons,

;/opt/odoo/addons/ADHOC/account-analytic,/opt/odoo/addons/ADHOC/account-financial-tools,/opt/odoo/addons/ADHOC/account-invoicing,/opt/odoo/addons/ADHOC/account-payment,/opt/odoo/addons/ADHOC/aeroo_reports,/opt/odoo/addons/ADHOC/argentina-reporting,/opt/odoo/addons/ADHOC/argentina-sale,/opt/odoo/addons/ADHOC/hr,/opt/odoo/addons/ADHOC/manufacture,/opt/odoo/addons/ADHOC/miscellaneous,/opt/odoo/addons/ADHOC/multi-store,/opt/odoo/addons/ADHOC/odoo-argentina,/opt/odoo/addons/ADHOC/odoo-support,/opt/odoo/addons/ADHOC/partner,/opt/odoo/addons/ADHOC/patches,/opt/odoo/addons/ADHOC/product,/opt/odoo/addons/ADHOC/project,/opt/odoo/addons/ADHOC/purchase,/opt/odoo/addons/ADHOC/reporting-engine,/opt/odoo/addons/ADHOC/sale,/opt/odoo/addons/ADHOC/stock,/opt/odoo/addons/ADHOC/survey,/opt/odoo/addons/ADHOC/website,

;/opt/odoo/addons/OCA/account-analytic,/opt/odoo/addons/OCA/account-closing,/opt/odoo/addons/OCA/account-financial-reporting,/opt/odoo/addons/OCA/account-financial-tools,/opt/odoo/addons/OCA/account-invoice-reporting,/opt/odoo/addons/OCA/account-invoicing,/opt/odoo/addons/OCA/account-payment,/opt/odoo/addons/OCA/account-reconcile,/opt/odoo/addons/OCA/bank-payment,/opt/odoo/addons/OCA/commission,/opt/odoo/addons/OCA/contract,/opt/odoo/addons/OCA/credit-control,/opt/odoo/addons/OCA/crm,/opt/odoo/addons/OCA/currency,/opt/odoo/addons/OCA/ddmrp,/opt/odoo/addons/OCA/donation,/opt/odoo/addons/OCA/e-commerce,/opt/odoo/addons/OCA/event,/opt/odoo/addons/OCA/field-service,/opt/odoo/addons/OCA/geospatial,/opt/odoo/addons/OCA/hr,/opt/odoo/addons/OCA/hr-timesheet,/opt/odoo/addons/OCA/knowledge,/opt/odoo/addons/OCA/manufacture,/opt/odoo/addons/OCA/manufacture-reporting,/opt/odoo/addons/OCA/margin-analysis,/opt/odoo/addons/OCA/mis-builder,/opt/odoo/addons/OCA/multi-company,/opt/odoo/addons/OCA/OpenUpgrade,/opt/odoo/addons/OCA/operating-unit,/opt/odoo/addons/OCA/partner-contact,/opt/odoo/addons/OCA/pos,/opt/odoo/addons/OCA/product-attribute,/opt/odoo/addons/OCA/product-variant,/opt/odoo/addons/OCA/project,/opt/odoo/addons/OCA/project-reporting,/opt/odoo/addons/OCA/purchase-workflow,/opt/odoo/addons/OCA/queue,/opt/odoo/addons/OCA/reporting-engine,/opt/odoo/addons/OCA/report-print-send,/opt/odoo/addons/OCA/rma,/opt/odoo/addons/OCA/sale-financial,/opt/odoo/addons/OCA/sale-reporting,/opt/odoo/addons/OCA/sale-workflow,/opt/odoo/addons/OCA/server-auth,/opt/odoo/addons/OCA/server-backend,/opt/odoo/addons/OCA/server-tools,/opt/odoo/addons/OCA/server-ux,/opt/odoo/addons/OCA/social,/opt/odoo/addons/OCA/stock-logistics-barcode,/opt/odoo/addons/OCA/stock-logistics-reporting,/opt/odoo/addons/OCA/stock-logistics-warehouse,/opt/odoo/addons/OCA/stock-logistics-workflow,/opt/odoo/addons/OCA/survey,/opt/odoo/addons/OCA/timesheet,/opt/odoo/addons/OCA/vertical-association,/opt/odoo/addons/OCA/vertical-hotel,/opt/odoo/addons/OCA/web,/opt/odoo/addons/OCA/website,

;/opt/odoo/addons/others/it-projects-llc-access-addons,/opt/odoo/addons/others/it-projects-llc-mail-addons,/opt/odoo/addons/others/it-projects-llc-sync-addons,/opt/odoo/addons/others/it-projects-llc-website-addons,/opt/odoo/addons/others/jobiols-odoo-addons,/opt/odoo/addons/others/regaby-odoo-addons,

EOF

sudo cp ~/odoo-server.conf /etc/odoo-server.conf
sudo chown odoo: /etc/odoo-server.conf
sudo chmod 640 /etc/odoo-server.conf

#----------------------------------------------------------------------------------
#  ========== SERVICIO ODOO ver 2.0 ==========
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

# Inicializar Automáticamente
sudo systemctl enable odoo-server.service

# Inicializamos o Detenemos
#sudo systemctl start odoo-server.service
#sudo systemctl stop odoo-server.service

#----------------------------------------------------------------------------------
#  ========== Localizacion argentina ADHOC  ==========

# Crear directorios para Addons
if [ -d /opt/odoo/addons/ ] ;
then
	echo "Directorio /opt/odoo/addons/ existente"
else
	sudo mkdir /opt/odoo/addons
	echo "Directorio /opt/odoo/addons/ creado"
fi

#Crear directorios para ADHOC
if [ -d /opt/odoo/addons/ADHOC/ ] ;
then
	echo "Directorio /opt/odoo/addons/ADHOC/ existente"
else
	sudo mkdir /opt/odoo/addons/ADHOC
	echo "Directorio /opt/odoo/addons/ADHOC/ creado"
fi

cd /opt/odoo/addons/ADHOC

sudo git clone --depth 1 --branch 12.0 --single-branch https://github.com/ingadhoc/account-analytic account-analytic
sudo git clone --depth 1 --branch 12.0 --single-branch https://github.com/ingadhoc/account-financial-tools account-financial-tools
sudo git clone --depth 1 --branch 12.0 --single-branch https://github.com/ingadhoc/account-invoicing account-invoicing
sudo git clone --depth 1 --branch 12.0 --single-branch https://github.com/ingadhoc/account-payment account-payment
sudo git clone --depth 1 --branch 12.0 --single-branch https://github.com/ingadhoc/aeroo_reports aeroo_reports
sudo git clone --depth 1 --branch 12.0 --single-branch https://github.com/ingadhoc/argentina-reporting argentina-reporting
sudo git clone --depth 1 --branch 12.0 --single-branch https://github.com/ingadhoc/argentina-sale argentina-sale
sudo git clone --depth 1 --branch 12.0 --single-branch https://github.com/ingadhoc/hr hr
sudo git clone --depth 1 --branch 12.0 --single-branch https://github.com/ingadhoc/miscellaneous miscellaneous
sudo git clone --depth 1 --branch 12.0 --single-branch https://github.com/ingadhoc/multi-company multi-company
sudo git clone --depth 1 --branch 12.0 --single-branch https://github.com/ingadhoc/multi-store multi-store
sudo git clone --depth 1 --branch 12.0 --single-branch https://github.com/ingadhoc/manufacture manufacture
#sudo git clone --depth 1 --branch 12.0 --single-branch https://github.com/ingadhoc/multi-company multi-company
sudo git clone --depth 1 --branch 12.0 --single-branch https://github.com/ingadhoc/odoo-argentina odoo-argentina
sudo git clone --depth 1 --branch 12.0 --single-branch https://github.com/ingadhoc/odoo-support odoo-support
sudo git clone --depth 1 --branch 12.0 --single-branch https://github.com/ingadhoc/partner partner
sudo git clone --depth 1 --branch 12.0 --single-branch https://github.com/ingadhoc/patches patches
sudo git clone --depth 1 --branch 12.0 --single-branch https://github.com/ingadhoc/product product
sudo git clone --depth 1 --branch 12.0 --single-branch https://github.com/ingadhoc/project project
sudo git clone --depth 1 --branch 12.0 --single-branch https://github.com/ingadhoc/purchase purchase
sudo git clone --depth 1 --branch 12.0 --single-branch https://github.com/ingadhoc/reporting-engine reporting-engine
sudo git clone --depth 1 --branch 12.0 --single-branch https://github.com/ingadhoc/sale sale
sudo git clone --depth 1 --branch 12.0 --single-branch https://github.com/ingadhoc/stock stock
sudo git clone --depth 1 --branch 12.0 --single-branch https://github.com/ingadhoc/survey survey
sudo git clone --depth 1 --branch 12.0 --single-branch https://github.com/ingadhoc/website website

sudo chown -R odoo:odoo -R /opt/odoo/addons
sudo chmod -R 775 /opt/odoo/addons

sudo su - odoo -s /bin/bash
cd /opt/odoo/addons/ADHOC

python3 -m pip install --user -r account-analytic/requirements.txt
python3 -m pip install --user -r account-financial-tools/requirements.txt
python3 -m pip install --user -r account-invoicing/requirements.txt
python3 -m pip install --user -r account-payment/requirements.txt
python3 -m pip install --user -r aeroo_reports/requirements.txt
python3 -m pip install --user -r argentina-reporting/requirements.txt
python3 -m pip install --user -r argentina-sale/requirements.txt
python3 -m pip install --user -r hr/requirements.txt
python3 -m pip install --user -r manufacture/requirements.txt
python3 -m pip install --user -r miscellaneous/requirements.txt
#python3 -m pip install --user -r multi-company/requirements.txt
python3 -m pip install --user -r multi-store/requirements.txt
python3 -m pip install --user -r odoo-argentina/requirements.txt
python3 -m pip install --user -r odoo-support/requirements.txt
python3 -m pip install --user -r partner/requirements.txt
python3 -m pip install --user -r patches/requirements.txt
python3 -m pip install --user -r product/requirements.txt
python3 -m pip install --user -r project/requirements.txt
python3 -m pip install --user -r purchase/requirements.txt
python3 -m pip install --user -r reporting-engine/requirements.txt
python3 -m pip install --user -r sale/requirements.txt
python3 -m pip install --user -r stock/requirements.txt
python3 -m pip install --user -r survey/requirements.txt
python3 -m pip install --user -r website/requirements.txt

exit
#----------------------------------------------------------------------------------
#  ========== Localizacion argentina OCA ==========

# Crear directorios para Addons
if [ -d /opt/odoo/addons/ ] ;
then
	echo "Directorio /opt/odoo/addons/ existente"
else
	sudo mkdir /opt/odoo/addons
	echo "Directorio /opt/odoo/addons/ creado"
fi

# Crear directorios para OCA
if [ -d /opt/odoo/addons/OCA/ ];
then
	echo "El directorio /opt/odoo/addons/OCA/ ya existe."
else
	sudo -H mkdir /opt/odoo/addons/OCA
	echo "Directorio /opt/odoo/addons/OCA/ creado."
fi

cd /opt/odoo/addons/OCA

sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/account-analytic account-analytic
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/account-closing account-closing
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/account-financial-reporting account-financial-reporting
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/account-financial-tools account-financial-tools
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/account-invoice-reporting account-invoice-reporting
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/account-invoicing account-invoicing
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/account-payment account-payment
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/account-reconcile account-reconcile
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/bank-payment bank-payment
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/commission commission
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/contract contract
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/credit-control credit-control
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/crm crm
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/currency currency
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/ddmrp ddmrp
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/donation donation
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/e-commerce e-commerce
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/event event
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/field-service field-service
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/geospatial geospatial
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/hr hr
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/hr-timesheet hr-timesheet
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/knowledge knowledge
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/manufacture manufacture
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/manufacture-reporting manufacture-reporting
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/margin-analysis margin-analysis
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/mis-builder mis-builder
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/multi-company multi-company
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/OpenUpgrade OpenUpgrade
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/operating-unit operating-unit
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/partner-contact partner-contact
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/pos pos
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/product-attribute product-attribute
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/product-variant product-variant
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/project project
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/project-reporting project-reporting
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/purchase-workflow purchase-workflow
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/queue queue
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/reporting-engine reporting-engine
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/report-print-send report-print-send
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/rma rma
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/sale-financial sale-financial
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/sale-reporting sale-reporting
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/sale-workflow sale-workflow
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/server-auth server-auth
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/server-backend server-backend
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/server-tools server-tools
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/server-ux server-ux
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/social social
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/stock-logistics-barcode stock-logistics-barcode
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/stock-logistics-reporting stock-logistics-reporting
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/stock-logistics-warehouse stock-logistics-warehouse
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/stock-logistics-workflow stock-logistics-workflow
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/survey survey
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/timesheet timesheet
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/vertical-association vertical-association
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/vertical-hotel vertical-hotel
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/web web
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/website website

sudo chown -R odoo:odoo -R /opt/odoo/addons
sudo chmod -R 775 /opt/odoo/addons

sudo su - odoo -s /bin/bash
cd /opt/odoo/addons/OCA

python3 -m pip install --user -r account-analytic/requirements.txt
python3 -m pip install --user -r account-closing/requirements.txt
python3 -m pip install --user -r account-financial-reporting/requirements.txt
python3 -m pip install --user -r account-financial-tools/requirements.txt
python3 -m pip install --user -r account-invoice-reporting/requirements.txt
python3 -m pip install --user -r account-invoicing/requirements.txt
python3 -m pip install --user -r account-payment/requirements.txt
python3 -m pip install --user -r account-reconcile/requirements.txt
python3 -m pip install --user -r bank-payment/requirements.txt
python3 -m pip install --user -r commission/requirements.txt
python3 -m pip install --user -r contract/requirements.txt
python3 -m pip install --user -r credit-control/requirements.txt
python3 -m pip install --user -r crm/requirements.txt
python3 -m pip install --user -r currency/requirements.txt
python3 -m pip install --user -r ddmrp/requirements.txt
python3 -m pip install --user -r donation/requirements.txt
python3 -m pip install --user -r e-commerce/requirements.txt
python3 -m pip install --user -r event/requirements.txt
python3 -m pip install --user -r field-service/requirements.txt
python3 -m pip install --user -r geospatial/requirements.txt
python3 -m pip install --user -r hr/requirements.txt
python3 -m pip install --user -r hr-timesheet/requirements.txt
python3 -m pip install --user -r knowledge/requirements.txt
python3 -m pip install --user -r manufacture/requirements.txt
python3 -m pip install --user -r manufacture-reporting/requirements.txt
python3 -m pip install --user -r margin-analysis/requirements.txt
python3 -m pip install --user -r mis-builder/requirements.txt
python3 -m pip install --user -r multi-company/requirements.txt
python3 -m pip install --user -r OpenUpgrade/requirements.txt
python3 -m pip install --user -r operating-unit/requirements.txt
python3 -m pip install --user -r partner-contact/requirements.txt
python3 -m pip install --user -r pos/requirements.txt
python3 -m pip install --user -r product-attribute/requirements.txt
python3 -m pip install --user -r product-variant/requirements.txt
python3 -m pip install --user -r project/requirements.txt
python3 -m pip install --user -r project-reporting/requirements.txt
python3 -m pip install --user -r purchase-workflow/requirements.txt
python3 -m pip install --user -r queue/requirements.txt
python3 -m pip install --user -r reporting-engine/requirements.txt
python3 -m pip install --user -r report-print-send/requirements.txt
python3 -m pip install --user -r rma/requirements.txt
python3 -m pip install --user -r sale-financial/requirements.txt
python3 -m pip install --user -r sale-reporting/requirements.txt
python3 -m pip install --user -r sale-workflow/requirements.txt
python3 -m pip install --user -r server-auth/requirements.txt
python3 -m pip install --user -r server-backend/requirements.txt
python3 -m pip install --user -r server-tools/requirements.txt
python3 -m pip install --user -r server-ux/requirements.txt
python3 -m pip install --user -r social/requirements.txt
python3 -m pip install --user -r stock-logistics-barcode/requirements.txt
python3 -m pip install --user -r stock-logistics-reporting/requirements.txt
python3 -m pip install --user -r stock-logistics-warehouse/requirements.txt
python3 -m pip install --user -r stock-logistics-workflow/requirements.txt
python3 -m pip install --user -r survey/requirements.txt
python3 -m pip install --user -r timesheet/requirements.txt
python3 -m pip install --user -r vertical-association/requirements.txt
python3 -m pip install --user -r vertical-hotel/requirements.txt
python3 -m pip install --user -r web/requirements.txt
python3 -m pip install --user -r website/requirements.txt

exit

#----------------------------------------------------------------------------------
#  ========== Localizacion argentina Otros/Varios ==========

# Crear directorios para Addons
if [ -d /opt/odoo/addons/ ] ;
then
	echo "Directorio /opt/odoo/addons/ existente"
else
	sudo mkdir /opt/odoo/addons
	echo "Directorio /opt/odoo/addons/ creado"
fi

# Crear directorios para OTROS
if [ -d /opt/odoo/addons/others/ ];
then
	echo "El directorio /opt/odoo/addons/others/ ya existe."
else
	sudo -H mkdir /opt/odoo/addons/others
	echo "Directorio /opt/odoo/addons/others/ creado."
fi

cd /opt/odoo/addons/others

# 2020-01-01 - Jobiols -> solo utilizarémos ARBA y SICORE.
# 2020-01-01 - Regaby -> solo utilizaremos ???
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/it-projects-llc/access-addons it-projects-llc-access-addons
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/it-projects-llc/mail-addons it-projects-llc-mail-addons
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/it-projects-llc/sync-addons it-projects-llc-sync-addons
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/it-projects-llc/website-addons it-projects-llc-website-addons
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/regaby/odoo-addons regaby-odoo-addons
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/jobiols/odoo-addons jobiols-odoo-addons

#REVISAR 
#https://github.com/jobiols/rafi16jan-backend-theme
#https://github.com/treytux/odoo-mailchimp-tools

sudo chown -R odoo:odoo -R /opt/odoo/addons
sudo chmod -R 775 /opt/odoo/addons

sudo su - odoo -s /bin/bash
cd /opt/odoo/addons/others

python3 -m pip install --user -r it-projects-llc-access-addons/requirements.txt
python3 -m pip install --user -r it-projects-llc-mail-addons/requirements.txt
python3 -m pip install --user -r it-projects-llc-sync-addons/requirements.txt
python3 -m pip install --user -r it-projects-llc-website-addons/requirements.txt
python3 -m pip install --user -r regaby-odoo-addons/requirements.txt
python3 -m pip install --user -r jobiols-odoo-addons/requirements.txt
python3 -m pip install --user -r jobiols-odoo-addons/l10n_ar_export_arba/requirements.txt
python3 -m pip install --user -r jobiols-odoo-addons/l10n_ar_export_sicore/requirements.txt

exit

#----------------------------------------------------------------------------------
#  ========== AEROO Docs ==========

#Lo ejecutamos como el usuario común, no Odoo
python3 -m pip install --user uno
python3 -m pip install --user jsonrpc2
python3 -m pip install --user daemonize
python3 -m pip install --user base
python3 -m pip install --user element
python3 -m pip install --user css

# NO SEGUI porque no estoy seguro.
python3 -m pip install --user payload
python3 -m pip install --user unobasefeature
python3 -m pip install --user unobasefield

#Creación de carpeta de Instalación
if [ -d /opt/aero/ ];
then
	echo "Directorio /opt/aero/ existente"
else
	sudo mkdir /opt/aeroo
	echo "Directorio /opt/aero/ creado"
fi

cd /opt/aeroo

# Creación de carpeta de Logs
if [ -d /var/log/aeroo-docs/ ];
then
	echo "Directorio /var/log/aeroo-docs/ existente"
else
	sudo mkdir /var/log/aeroo-docs
	echo "Directorio /var/log/aeroo-docs/ creado"
fi


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

#----------------------------------------------------------------------------------
# ========== Nginx ==========
# https://github.com/sebatista/odoo-nginx-le/blob/master/odoo-nginx-le.sh
# https://linuxize.com/post/configure-odoo-with-nginx-as-a-reverse-proxy/
sudo apt update -y

# Instalamos el Nginx
sudo apt install nginx -y

#Comprobar estado
sudo systemctl status nginx

#Comprobar versión
sudo nginx -v

# Habilitamos el servicio nginx
sudo systemctl enable nginx

#Creamos un archivo para nuestro sitio.
sudo nano /etc/nginx/sites-available/odoo


#Creamos un link simbólico
sudo ln -s /etc/nginx/sites-available/odoo odoo



# Configuration files
sudo vi /etc/nginx/nginx.conf



# FAlta configurar el site



# Instalar ufw
sudo apt install ufw -y

# Comprobamos el estado
sudo ufw status verbose

# Para saber mas información sobre una aplicación configuradas
sudo ufw app info 'Nginx Full'

# Habilitamos el puerto de SSH por si no está
sudo ufw allow ssh

# Luego de configurar UFW es necesario activarlo
sudo ufw enable

# Si se utiliza UFW Configuramos el firewall
sudo ufw allow 'Nginx Full'

#Comprobamos el estado
sudo ufw status

#Comprobamos la instalación desde un navegador
#http://YOUR_IP

# Instalamos el Let's Encrypt

# Prerequisitos. Ya debería estar pero lo dejamos por aquí
#sudo apt install software-properties-common -y

# Agregamos repositorio necesario
sudo add-apt-repository ppa:certbot/certbot -y

# Actualizamos e instalamos
sudo apt update -y
sudo apt install certbot -y

# Generar Deffie-Hellman key exchange.
sudo openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048

# Obtaining a Let’s Encrypt SSL certificate


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

sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y
#----------------------------------------------------------------------------------
# ========== Git ==========
# git --version
sudo apt install git -y

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

#sudo pip install virtualenvwrapper
#source /usr/local/bin/virtualenvwrapper.sh

#sudo apt-get install python-dev -y
#sudo apt-get install python-pip -y

#----------------------------------------------------------------------------------
# ========== dependencias de development previas ==========
sudo apt-get install software-properties-common
sudo apt-get install libxslt-dev -y
sudo apt-get install build-essential -y
sudo apt-get install libzip-dev -y 
sudo apt-get install libldap2-dev -y
sudo apt-get install libsasl2-dev -y
sudo apt-get install node-less -y
sudo apt-get install gdebi -y
sudo apt-get install wget -y
sudo apt-get install zlib1g-dev -y
sudo apt-get install npm -y
sudo apt-get install libxml2-dev -y
sudo apt-get install libxslt1-dev -y
sudo apt-get install libssl-dev -y
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

sudo npm install -g rtlcss

#----------------------------------------------------------------------------------
#Descargarlo manualmente
wget http://security.ubuntu.com/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1.1_amd64.deb
sudo apt install ./libpng12-0_1.2.54-1ubuntu1.1_amd64.deb
#Agregar repositorio
sudo add-apt-repository ppa:linuxuprising/libpng12
sudo apt update
sudo apt install libpng12-0

#----------------------------------------------------------------------------------
# ========== postgresql ==========
# postgresql --version

sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

wget -O psqlkey https://www.postgresql.org/media/keys/ACCC4CF8.asc
sudo apt-key add psqlkey
#sudo rm psql

sudo apt-get update
sudo apt-get install postgresql-12 -y
sudo apt-get install pgadmin4 -y

#Creamos un usuario y la base de datos de Postgresql con el usuario actual
sudo -u postgres createuser -s $USER
createdb $USER

#----------------------------------------------------------------------------------
# Install Wkhtmltopdf if needed
# https://github.com/wkhtmltopdf/wkhtmltopdf/releases

#Ubuntu 18.04 Bionic Beaver
wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.bionic_amd64.deb
sudo gdebi --n `basename https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.bionic_amd64.deb`

# Continuar
sudo ln -s /usr/local/bin/wkhtmltopdf /usr/bin
sudo ln -s /usr/local/bin/wkhtmltoimage /usr/bin

#----------------------------------------------------------------------------------
# ========== Odoo ==========
# git clone https://github.com/odoo/odoo.git
cd /opt/
sudo mkdir odoo
cd odoo
sudo chown sise:sise ./
git clone --depth 1 --branch 12.0 --single-branch https://github.com/odoo/odoo.git odoo-server/

#----------------------------------------------------------------------------------
#Instalamos las dependendencias y requerimientos de Odoo.
cd odoo/
pip3 install -r ./requirements.txt
pip3 install -r ./doc/requirements.txt

#----------------------------------------------------------------------------------
# sudo su - odoo -s /bin/bash
cd odoo/
python3 odoo-bin --addons-path=addons -d sise

#----------------------------------------------------------------------------------
sudo mkdir /var/log/odoo
sudo chown -R sise:sise /var/log/odoo

#----------------------------------------------------------------------------------
# Creamos el archivo de configuracion de odoo
cat <<EOF > ~/odoo-server.conf
[options]
; admin_passwd = admin
db_host = False
db_port = False
db_user = odoo
db_password = False
logfile = /var/log/odoo/odoo-server.log
addons_path = /opt/odoo/odoo-server/addons

EOF


sudo cp ~/odoo-server.conf /etc/odoo-server.conf
sudo chown sise: /etc/odoo-server.conf
sudo chmod 640 /etc/odoo-server.conf

#----------------------------------------------------------------------------------
# SERVICIO ODOO ver 2.0
cat <<EOF > ~/odoo-server.service
[Unit]
Description=Odoo Open Source ERP and CRM

[Service]
Type=simple
PermissionsStartOnly=true
SyslogIdentifier=odoo-server
User=sise
Group=sise
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

#----------------------------------------------------------------------------------
# Localizacion argentina ADHOC

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

sudo chown -R sise:sise -R /opt/odoo/addons
sudo chmod -R 775 /opt/odoo/addons

pip3 install -r account-analytic/requirements.txt
pip3 install -r account-financial-tools/requirements.txt
pip3 install -r account-invoicing/requirements.txt
pip3 install -r account-payment/requirements.txt
pip3 install -r aeroo_reports/requirements.txt
pip3 install -r argentina-reporting/requirements.txt
pip3 install -r argentina-sale/requirements.txt
pip3 install -r hr/requirements.txt
pip3 install -r manufacture/requirements.txt
pip3 install -r miscellaneous/requirements.txt
#pip3 install -r multi-company/requirements.txt
pip3 install -r multi-store/requirements.txt
pip3 install -r odoo-argentina/requirements.txt
pip3 install -r odoo-support/requirements.txt
pip3 install -r partner/requirements.txt
pip3 install -r patches/requirements.txt
pip3 install -r product/requirements.txt
pip3 install -r project/requirements.txt
pip3 install -r purchase/requirements.txt
pip3 install -r reporting-engine/requirements.txt
pip3 install -r sale/requirements.txt
pip3 install -r stock/requirements.txt
pip3 install -r survey/requirements.txt
pip3 install -r website/requirements.txt

#----------------------------------------------------------------------------------
# Localizacion argentina OCA

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

sudo chown -R sise:sise -R /opt/odoo/addons
sudo chmod -R 775 /opt/odoo/addons

pip3 install -r account-analytic/requirements.txt
pip3 install -r account-closing/requirements.txt
pip3 install -r account-financial-reporting/requirements.txt
pip3 install -r account-financial-tools/requirements.txt
pip3 install -r account-invoice-reporting/requirements.txt
pip3 install -r account-invoicing/requirements.txt
pip3 install -r account-payment/requirements.txt
pip3 install -r account-reconcile/requirements.txt
pip3 install -r bank-payment/requirements.txt
pip3 install -r commission/requirements.txt
pip3 install -r contract/requirements.txt
pip3 install -r credit-control/requirements.txt
pip3 install -r crm/requirements.txt
pip3 install -r currency/requirements.txt
pip3 install -r ddmrp/requirements.txt
pip3 install -r donation/requirements.txt
pip3 install -r e-commerce/requirements.txt
pip3 install -r event/requirements.txt
pip3 install -r field-service/requirements.txt
pip3 install -r geospatial/requirements.txt
pip3 install -r hr/requirements.txt
pip3 install -r hr-timesheet/requirements.txt
pip3 install -r knowledge/requirements.txt
pip3 install -r manufacture/requirements.txt
pip3 install -r manufacture-reporting/requirements.txt
pip3 install -r margin-analysis/requirements.txt
pip3 install -r mis-builder/requirements.txt
pip3 install -r multi-company/requirements.txt
pip3 install -r OpenUpgrade/requirements.txt
pip3 install -r operating-unit/requirements.txt
pip3 install -r partner-contact/requirements.txt
pip3 install -r pos/requirements.txt
pip3 install -r product-attribute/requirements.txt
pip3 install -r product-variant/requirements.txt
pip3 install -r project/requirements.txt
pip3 install -r project-reporting/requirements.txt
pip3 install -r purchase-workflow/requirements.txt
pip3 install -r queue/requirements.txt
pip3 install -r reporting-engine/requirements.txt
pip3 install -r report-print-send/requirements.txt # ERROR pycups
pip3 install -r rma/requirements.txt
pip3 install -r sale-financial/requirements.txt
pip3 install -r sale-reporting/requirements.txt
pip3 install -r sale-workflow/requirements.txt
pip3 install -r server-auth/requirements.txt
pip3 install -r server-backend/requirements.txt # ERROR mysqlclient
pip3 install -r server-tools/requirements.txt
pip3 install -r server-ux/requirements.txt
pip3 install -r social/requirements.txt
pip3 install -r stock-logistics-barcode/requirements.txt
pip3 install -r stock-logistics-reporting/requirements.txt
pip3 install -r stock-logistics-warehouse/requirements.txt
pip3 install -r stock-logistics-workflow/requirements.txt
pip3 install -r survey/requirements.txt
pip3 install -r timesheet/requirements.txt
pip3 install -r vertical-association/requirements.txt
pip3 install -r vertical-hotel/requirements.txt
pip3 install -r web/requirements.txt
pip3 install -r website/requirements.txt

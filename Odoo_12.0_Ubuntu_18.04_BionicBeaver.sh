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
;,/opt/odoo/addons/account-financial-tools-11.0,/opt/odoo/addons/argentina-sale-11.0,/opt/odoo/addons/reporting-engine-11.0,/opt/odoo/addons/account-payment-11.0,/opt/odoo/addons/miscellaneous-11.0,/opt/odoo/addons/stock-11.0,/opt/odoo/addons/aeroo_reports-11.0,/opt/odoo/addons/odoo-argentina-11.0,/opt/odoo/addons/argentina-reporting-11.0,/opt/odoo/addons/partner_identification
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



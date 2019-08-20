# Script de instalacion de Odoo 11 (ADHOC)
# Servidor: Debian 9.5 (Stretch)
# Basada en recolipacion hecha por Gaston Pablo Perez

# Actualizar repositorios e instalar actaulizaciones
sudo apt-get update
sudo apt-get upgrade -y

# Instalar dependencias de python para Odoo 11
sudo -H apt-get install python3-pip -y
sudo -H apt-get install curl -y
sudo -H apt-get install software-properties-common -y
sudo -H apt-get install mc -y
sudo -H apt-get install postgresql -y
sudo -H apt-get install python-psycopg2 -y
sudo -H apt-get install libpq-dev -y

sudo -H pip3 install --upgrade pip

# Instalar dependencias usando pip3
sudo -H pip3 install Babel
sudo -H pip3 install decorator
sudo -H pip3 install docutils
sudo -H pip3 install ebaysdk
sudo -H pip3 install feedparser
sudo -H pip3 install gevent
sudo -H pip3 install greenlet
sudo -H pip3 install html2text
sudo -H pip3 install Jinja2
sudo -H pip3 install lxml
sudo -H pip3 install Mako
sudo -H pip3 install MarkupSafe
sudo -H pip3 install mock
sudo -H pip3 install num2words
sudo -H pip3 install ofxparse
sudo -H pip3 install passlib
sudo -H pip3 install Pillow
sudo -H pip3 install psutil
sudo -H pip3 install psycogreen
sudo -H pip3 install psycopg2
sudo -H pip3 install pydot
sudo -H pip3 install pyparsing
sudo -H pip3 install PyPDF2
sudo -H pip3 install pyserial
sudo -H pip3 install python-dateutil
sudo -H pip3 install python-openid
sudo -H pip3 install pytz
sudo -H pip3 install pyusb
sudo -H pip3 install PyYAML
sudo -H pip3 install qrcode
sudo -H pip3 install reportlab
sudo -H pip3 install requests
sudo -H pip3 install six
sudo -H pip3 install suds-jurko
sudo -H pip3 install vatnumber 
sudo -H pip3 install vobject
sudo -H pip3 install Werkzeug
sudo -H pip3 install XlsxWriter
sudo -H pip3 install xlwt
sudo -H pip3 install xlrd 

# Luego de instalar Odoo me pidio esta dependencia
sudo -H pip3 install phonenumbers

# Instacion de dependecias para Web Odoo
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo -H apt-get install nodejs -y
sudo -H apt-get install build-essential -y
sudo -H apt-get install gcc -y
sudo -H apt-get install g++ -y
sudo -H apt-get install make -y
sudo -H npm install -g less
sudo -H npm install -g less-plugin-clean-css
sudo -H apt-get install node-less -y

# Instalacion de Postgresql 9.6
# En Debian 9.5 esta en los repositorios pero si no esta usar:
#
# sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
# wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo -H apt-get update
sudo -H apt-get install postgresql-9.5 -y
sudo -H apt-get install postgresql-client-9.5 -y
sudo -H apt-get install postgresql-contrib-9.5 -y
sudo -H apt-get install libpq5 -y
sudo -H apt-get install sysstat -y

# Creamos el usuario para la base de datos de Odoo
sudo su postgres -c "createuser -s odoo"

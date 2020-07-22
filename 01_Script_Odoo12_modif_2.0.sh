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
sudo -H apt-get install git -y
sudo -H apt-get install libsasl2-dev -y
sudo -H apt-get install python-dev -y
sudo -H apt-get install libldap2-dev -y
sudo -H apt-get install libssl-dev -y

pip3 install --upgrade pip
pip3 install --upgrade setuptools 

# Instalar dependencias usando pip3
# .local/lib/pythonX.Y/site-packages
pip3 install Babel
pip3 install decorator
pip3 install docutils
pip3 install ebaysdk
pip3 install feedparser
pip3 install gevent
pip3 install greenlet
pip3 install html2text
pip3 install Jinja2
pip3 install lxml
pip3 install Mako
pip3 install MarkupSafe
pip3 install mock
pip3 install num2words
pip3 install ofxparse
pip3 install passlib
pip3 install Pillow
pip3 install psutil
pip3 install psycogreen
pip3 install psycopg2
pip3 install pydot
pip3 install pyparsing
pip3 install PyPDF2
pip3 install pyserial
pip3 install python-dateutil
pip3 install python-openid
pip3 install pytz
pip3 install pyusb
pip3 install PyYAML
pip3 install qrcode
pip3 install reportlab
pip3 install requests
pip3 install six
pip3 install suds-jurko
pip3 install vatnumber 
pip3 install vobject
pip3 install Werkzeug
pip3 install XlsxWriter
pip3 install xlwt
pip3 install xlrd 
pip3 install phonenumbers
pip3 install pycryptodome

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
sudo -H apt-get install postgresql-10 -y
sudo -H apt-get install postgresql-client-10 -y
sudo -H apt-get install postgresql-contrib-10 -y
sudo -H apt-get install libpq5 -y
sudo -H apt-get install sysstat -y

# Creamos el usuario para la base de datos de Odoo
sudo su postgres -c "createuser -s odoo"

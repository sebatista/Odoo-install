#
# Esto no se para que es.
#
sudo -H apt-get install unoconv

# Instalacion de wkhtmltox
cd /opt

sudo apt-get remove libqt4-dev
sudo apt-get remove qt4-dev-tools
sudo apt-get remove wkhtmltopdf

sudo apt-get autoremove

sudo -H apt-get install openssl -y
sudo -H apt-get install build-essential -y
sudo -H apt-get install libssl-dev -y
sudo -H apt-get install libxrender-dev -y
sudo -H apt-get install git-core -y
sudo -H apt-get install libx11-dev -y
sudo -H apt-get install libxext-dev -y
sudo -H apt-get install libfontconfig1-dev -y
sudo -H apt-get install libfreetype6-dev -y
sudo -H apt-get install fontconfig -y

# Descargamos herramientas opcionales necesarias
sudo wget http://archive.ubuntu.com/ubuntu/pool/main/libj/libjpeg-turbo/libjpeg-turbo8_1.5.2-0ubuntu5.18.04.1_amd64.deb
sudo wget http://ftp.br.debian.org/debian/pool/main/libp/libpng/libpng12-0_1.2.50-2+deb8u3_amd64.deb
sudo wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.1/wkhtmltox-0.12.1_linux-trusty-amd64.deb

sudo -H dpkg -i libjpeg-turbo8_1.5.2-0ubuntu5.18.04.1_amd64.deb
sudo -H dpkg -i libpng12-0_1.2.50-2+deb8u3_amd64.deb
sudo -H dpkg -i wkhtmltox-0.12.1_linux-trusty-amd64.deb

#Falla
#sudo wget http://security.debian.org/debian-security/pool/updates/main/o/openssl/libssl1.0.0_1.0.1t-1+deb7u4_amd64.deb
#sudo -H dpkg -i libssl1.0.0_1.0.1t-1+deb7u4_amd64.deb

sudo ln -s /usr/local/bin/wkhtmltopdf /usr/bin
sudo ln -s /usr/local/bin/wkhtmltoimage /usr/bin

#
# Problema de permisos en carpeta cache de pyafipws
# generalmente en /usr/local/lib/python3.5/dist-packages/pyafipws
#
# FALTA UN DIRECTORIO DE CACHE. Hay que crear el directorio
#
sudo chown www-data -R /usr/local/lib/python3.5/dist-packages/pyafipws
sudo chmod a+xr -R /usr/local/lib/python3.5/dist-packages/pyafipws
sudo chmod a+xwrt -R /usr/local/lib/python3.5/dist-packages/pyafipws/__pycache__/

# Odoo instalado... reiniciando - PROBAR
# sudo su root -c "/etc/init.d/odoo-server restart"
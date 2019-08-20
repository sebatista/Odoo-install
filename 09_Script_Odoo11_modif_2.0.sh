#
# Aeroo Reports
# 
sudo -H apt-get install default-jre -y
sudo -H apt-get install git -y
sudo -H apt-get install python3-setuptools -y
sudo -H apt-get install python3-uno -y
sudo -H apt-get install python3-lxml -y

sudo -H pip3 install jsonrpc2
sudo -H pip3 install daemonize

#
# Instalar aeroo_docs desde github oficial
#

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

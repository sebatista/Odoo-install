#
# Módulos de Educat
#

# Crear directorios para Addons
if [ -d /opt/odoo/addons/ ] ;
then
	echo "Directorio /opt/odoo/addons/ existente"
else
	sudo mkdir /opt/odoo/addons
	echo "Directorio /opt/odoo/addons/ creado"
fi

# Crear directorios para OTROS
if [ -d /opt/odoo/addons/educat/ ];
then
	echo "El directorio /opt/odoo/addons/educat/ ya existe."
else
	sudo -H mkdir /opt/odoo/addons/educat
	echo "Directorio /opt/odoo/addons/educat/ creado."
fi

cd /opt/odoo/addons/educat

sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/openeducat/openeducat_erp openeducat

sudo chown -R odoo:odoo -R /opt/odoo/addons
sudo chmod -R 775 /opt/odoo/addons

pip3 install -r openeducat/requirements.txt

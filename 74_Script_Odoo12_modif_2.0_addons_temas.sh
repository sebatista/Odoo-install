#
# Localizacion argentina Otros/Varios
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
if [ -d /opt/odoo/addons/temas/ ];
then
	echo "El directorio /opt/odoo/addons/temas/ ya existe."
else
	sudo -H mkdir /opt/odoo/addons/temas
	echo "Directorio /opt/odoo/addons/temas/ creado."
fi

cd /opt/odoo/addons/temas


sudo unzip theme_nice_bootstrap-12.0.1.0.zip

sudo chown -R odoo:odoo -R /opt/odoo/addons
sudo chmod -R 775 /opt/odoo/addons

pip3 install -r theme_common/requirements.txt
pip3 install -r theme_nice_bootstrap/requirements.txt
pip3 install -r website_animate/requirements.txt

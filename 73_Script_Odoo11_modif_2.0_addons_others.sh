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
if [ -d /opt/odoo/addons/others/ ];
then
	echo "El directorio /opt/odoo/addons/others/ ya existe."
else
	sudo -H mkdir /opt/odoo/addons/others
	echo "Directorio /opt/odoo/addons/others/ creado."
fi

cd /opt/odoo/addons/others


sudo -H git clone https://github.com/akretion/odoo-usability -b 11.0 others-akretion-odoo-usability
sudo -H git clone https://github.com/it-projects-llc/website-addons -b 11.0 others-it-projects-llc-website-addons
# 2020-01-01 - Jobiols -> solo utilizarémos ARBA y SICORE.
sudo -H git clone https://github.com/jobiols/odoo-addons -b 11.0 jobiols-addons
# 2020-01-01 - Regaby -> solo utilizaremos 
sudo -H git clone https://github.com/regaby/odoo-addons -b 11.0 regaby-addons


#sudo -H pip3 install -r others-akretion-odoo-usability/requirements.txt
sudo -H pip3 install -r others-it-projects-llc-website-addons/requirements.txt
#Probar
sudo -H pip3 install -r jobiols-addons/l10n_ar_export_arba/requirements.txt
sudo -H pip3 install -r jobiols-addons/l10n_ar_export_sicore/requirements.txt
sudo -H pip3 install -r regaby-addons/requirements.txt
#Termina prueba

sudo chown -R odoo:odoo -R /opt/odoo/addons
sudo chmod -R 775 /opt/odoo/addons


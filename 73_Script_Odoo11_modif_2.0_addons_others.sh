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


# 2020-01-01 - Jobiols -> solo utilizarémos ARBA y SICORE.
# 2020-01-01 - Regaby -> solo utilizaremos ???
sudo -H git clone https://github.com/it-projects-llc/website-addons -b 11.0 others-it-projects-llc-website-addons
sudo -H git clone https://github.com/akretion/odoo-usability -b 11.0 others-akretion-odoo-usability
#sudo -H git clone https://github.com/jobiols/odoo-addons -b 11.0 jobiols-odoo-addons
sudo -H git clone https://github.com/sebatista/jobiols-odoo-addons -b 11.0 jobiols-odoo-addons
sudo -H git clone https://github.com/regaby/odoo-addons -b 11.0 regaby-odoo-addons


sudo -H pip3 install -r others-it-projects-llc-website-addons/requirements.txt
sudo -H pip3 install -r others-akretion-odoo-usability/requirements.txt
sudo -H pip3 install -r jobiols-odoo-addons/l10n_ar_export_arba/requirements.txt
sudo -H pip3 install -r jobiols-odoo-addons/l10n_ar_export_sicore/requirements.txt
sudo -H pip3 install -r regaby-odoo-addons/requirements.txt

sudo chown -R odoo:odoo -R /opt/odoo/addons
sudo chmod -R 775 /opt/odoo/addons


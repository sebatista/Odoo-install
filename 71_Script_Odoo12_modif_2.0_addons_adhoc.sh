#
# Localizacion argentina ADHOC
#

# Crear directorios para Addons
if [ -d /opt/odoo/addons/ ] ;
then
	echo "Directorio /opt/odoo/addons/ existente"
else
	sudo mkdir /opt/odoo/addons
	echo "Directorio /opt/odoo/addons/ creado"
fi

#Crear directorios para adhoc
if [ -d /opt/odoo/addons/adhoc/ ] ;
then
	echo "Directorio /opt/odoo/addons/adhoc/ existente"
else
	sudo mkdir /opt/odoo/addons/adhoc
	echo "Directorio /opt/odoo/addons/adhoc/ creado"
fi

cd /opt/odoo/addons/adhoc

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
sudo git clone --depth 1 --branch 12.0 --single-branch https://github.com/ingadhoc/multi-company multi-company
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

sudo chown -R odoo:odoo -R /opt/odoo/addons
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
pip3 install -r multi-company/requirements.txt
pip3 install -r multi-store/requirements.txt
pip3 install -r odoo-argentina/requirements.txt
pip3 install -r odoo-support/requirements.txt
pip3 install -r partner/requirements.txt
pip3 install -r patches/requirements.txt
pip3 install -r product/requirements.txt
pip3 install -r project/requirements.txt
pip3 install -r purchase/requirements.txt
pip3 install -r reporting-engine/requirements.txt	#GENERÓ ERRORES - pycups
pip3 install -r sale/requirements.txt
pip3 install -r stock/requirements.txt
pip3 install -r survey/requirements.txt
pip3 install -r website/requirements.txt


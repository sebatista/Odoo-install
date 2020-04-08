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

#Crear directorios para ADHOC
if [ -d /opt/odoo/addons/ADHOC/ ] ;
then
	echo "Directorio /opt/odoo/addons/ADHOC/ existente"
else
	sudo mkdir /opt/odoo/addons/ADHOC
	echo "Directorio /opt/odoo/addons/ADHOC/ creado"
fi

cd /opt/odoo/addons/ADHOC

sudo git clone --depth 1 --branch 11.0 --single-branch https://github.com/ingadhoc/account-analytic account-analytic
sudo git clone --depth 1 --branch 11.0 --single-branch https://github.com/ingadhoc/account-financial-tools account-financial-tools
sudo git clone --depth 1 --branch 11.0 --single-branch https://github.com/ingadhoc/account-invoicing account-invoicing
sudo git clone --depth 1 --branch 11.0 --single-branch https://github.com/ingadhoc/account-payment account-payment
sudo git clone --depth 1 --branch 11.0 --single-branch https://github.com/ingadhoc/aeroo_reports aeroo_reports
sudo git clone --depth 1 --branch 11.0 --single-branch https://github.com/ingadhoc/argentina-reporting argentina-reporting
sudo git clone --depth 1 --branch 11.0 --single-branch https://github.com/ingadhoc/argentina-sale argentina-sale
sudo git clone --depth 1 --branch 11.0 --single-branch https://github.com/ingadhoc/hr hr
sudo git clone --depth 1 --branch 11.0 --single-branch https://github.com/ingadhoc/miscellaneous miscellaneous
sudo git clone --depth 1 --branch 11.0 --single-branch https://github.com/ingadhoc/multi-company multi-company
sudo git clone --depth 1 --branch 11.0 --single-branch https://github.com/ingadhoc/multi-store multi-store
sudo git clone --depth 1 --branch 11.0 --single-branch https://github.com/ingadhoc/manufacture manufacture
sudo git clone --depth 1 --branch 11.0 --single-branch https://github.com/ingadhoc/multi-company multi-company
sudo git clone --depth 1 --branch 11.0 --single-branch https://github.com/ingadhoc/odoo-argentina odoo-argentina
sudo git clone --depth 1 --branch 11.0 --single-branch https://github.com/ingadhoc/odoo-support odoo-support
sudo git clone --depth 1 --branch 11.0 --single-branch https://github.com/ingadhoc/partner partner
sudo git clone --depth 1 --branch 11.0 --single-branch https://github.com/ingadhoc/patches patches
sudo git clone --depth 1 --branch 11.0 --single-branch https://github.com/ingadhoc/product product
sudo git clone --depth 1 --branch 11.0 --single-branch https://github.com/ingadhoc/project project
sudo git clone --depth 1 --branch 11.0 --single-branch https://github.com/ingadhoc/purchase purchase
sudo git clone --depth 1 --branch 11.0 --single-branch https://github.com/ingadhoc/reporting-engine reporting-engine
sudo git clone --depth 1 --branch 11.0 --single-branch https://github.com/ingadhoc/sale sale
sudo git clone --depth 1 --branch 11.0 --single-branch https://github.com/ingadhoc/stock stock
sudo git clone --depth 1 --branch 11.0 --single-branch https://github.com/ingadhoc/survey survey
sudo git clone --depth 1 --branch 11.0 --single-branch https://github.com/ingadhoc/website website

#sudo wget https://github.com/ingadhoc/account-financial-tools/archive/11.0.zip -O ingadhoc-account-financial-tools.zip
#sudo wget https://github.com/ingadhoc/account-invoicing/archive/11.0.zip -O ingadhoc-account-invoicing.zip
#sudo wget https://github.com/ingadhoc/account-payment/archive/11.0.zip -O ingadhoc-account-payment.zip
#sudo wget https://github.com/ingadhoc/aeroo_reports/archive/11.0.zip -O ingadhoc-aeroo_reports.zip
#sudo wget https://github.com/ingadhoc/argentina-reporting/archive/11.0.zip -O ingadhoc-argentina-reporting.zip
#sudo wget https://github.com/ingadhoc/argentina-sale/archive/11.0.zip -O ingadhoc-argentina-sale.zip
#sudo wget https://github.com/ingadhoc/miscellaneous/archive/11.0.zip -O ingadhoc-miscellaneous.zip
#sudo wget https://github.com/ingadhoc/multi-store/archive/11.0.zip -O ingadhoc-multi-store.zip
#sudo wget https://github.com/ingadhoc/odoo-argentina/archive/11.0.zip -O ingadhoc-odoo-argentina.zip
#sudo wget https://github.com/ingadhoc/reporting-engine/archive/11.0.zip -O ingadhoc-reporting-engine.zip
#sudo wget https://github.com/ingadhoc/sale/archive/11.0.zip -O ingadhoc-sale.zip
#sudo wget https://github.com/ingadhoc/stock/archive/11.0.zip -O ingadhoc-stock.zip

#sudo unzip ingadhoc-account-financial-tools.zip
#sudo unzip ingadhoc-account-invoicing.zip
#sudo unzip ingadhoc-account-payment.zip
#sudo unzip ingadhoc-aeroo_reports.zip
#sudo unzip ingadhoc-argentina-reporting.zip
#sudo unzip ingadhoc-argentina-sale.zip
#sudo unzip ingadhoc-miscellaneous.zip
#sudo unzip ingadhoc-multi-store.zip
#sudo unzip ingadhoc-odoo-argentina.zip
#sudo unzip ingadhoc-reporting-engine.zip
#sudo unzip ingadhoc-sale.zip
#sudo unzip ingadhoc-stock.zip

#sudo rm ingadhoc-account-financial-tools.zip
#sudo rm ingadhoc-account-invoicing.zip
#sudo rm ingadhoc-account-payment.zip
#sudo rm ingadhoc-aeroo_reports.zip
#sudo rm ingadhoc-argentina-reporting.zip
#sudo rm ingadhoc-argentina-sale.zip
#sudo rm ingadhoc-miscellaneous.zip
#sudo rm ingadhoc-multi-store.zip
#sudo rm ingadhoc-odoo-argentina.zip
#sudo rm ingadhoc-reporting-engine.zip
#sudo rm ingadhoc-sale.zip
#sudo rm ingadhoc-stock.zip

sudo chown -R odoo:odoo -R /opt/odoo/addons
sudo chmod -R 775 /opt/odoo/addons

pip3 install -r account-analytic/requirements.txt
#pip3 install -r account-financial-tools/requirements.txt
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


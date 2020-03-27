#
# Localizacion argentina OCA
#

# Crear directorios para Addons
if [ -d /opt/odoo/addons/ ] ;
then
	echo "Directorio /opt/odoo/addons/ existente"
else
	sudo mkdir /opt/odoo/addons
	echo "Directorio /opt/odoo/addons/ creado"
fi

# Crear directorios para OCA
if [ -d /opt/odoo/addons/OCA/ ];
then
	echo "El directorio /opt/odoo/addons/OCA/ ya existe."
else
	sudo -H mkdir /opt/odoo/addons/OCA
	echo "Directorio /opt/odoo/addons/OCA/ creado."
fi

cd /opt/odoo/addons/OCA

#--depth 1 Es para que únicamente se clone la última versión y no ocupe tanto espacio.
sudo -H git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/server-tools OCA-server-tools
sudo -H git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/server-ux OCA-server-ux
sudo -H git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/sale-workflow OCA-sale-workflow
sudo -H git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/sale-financial OCA-sale-financial
sudo -H git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/purchase-workflow OCA-purchase-workflow
sudo -H git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/account-financial-tools OCA-account-financial-tools
sudo -H git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/account-financial-reporting OCA-account-financial-reporting
sudo -H git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/account-invoicing OCA-account-invoicing
sudo -H git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/account-payment OCA-account-payment
sudo -H git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/account-analytic OCA-account-analytic
sudo -H git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/reporting-engine OCA-reporting-engine
sudo -H git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/stock-logistics-workflow OCA-stock-logistics-workflow
sudo -H git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/stock-logistics-warehouse OCA-stock-logistics-warehouse
sudo -H git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/knowledge OCA-knowledge
sudo -H git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/manufacture OCA-manufacture
sudo -H git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/margin-analysis OCA-margin-analysis
sudo -H git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/crm OCA-crm
sudo -H git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/hr OCA-hr
sudo -H git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/hr-timesheet OCA-hr-timesheet
sudo -H git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/commission OCA-commission
sudo -H git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/report-print-send OCA-report-print-send
sudo -H git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/social OCA-social
sudo -H git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/contract OCA-contract
sudo -H git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/web OCA-web
sudo -H git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/website OCA-website
sudo -H git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/product-variant OCA-product-variant
sudo -H git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/product-attribute OCA-product-attribute
sudo -H git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/partner-contact OCA-partner-contact
sudo -H git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/e-commerce OCA-e-commerce
sudo -H git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/queue OCA-queue
sudo -H git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/operating-unit.git OCA-operating-unit
sudo -H git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/sale-reporting.git OCA-sale-reporting

git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/account-closing.git OCA-account-closing
git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/account-invoice-reporting.git OCA-account-invoice-reporting
git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/account-reconcile.git OCA-account-reconcile
git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/bank-payment.git OCA-bank-payment
git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/credit-control.git OCA-credit-control
git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/currency.git OCA-currency
git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/donation.git OCA-donation
git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/event.git OCA-event
git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/field-service.git OCA-field-service
git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/geospatial.git OCA-geospatial
git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/manufacture-reporting.git OCA-manufacture-reporting
git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/multi-company.git OCA-multi-company
git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/OpenUpgrade.git OCA-OpenUpgrade
git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/pos.git OCA-pos
git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/project.git OCA-project
git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/project-reporting.git OCA-project-reporting
git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/rma.git OCA-rma
git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/server-auth.git OCA-server-auth
git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/server-backend.git OCA-server-backend
git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/stock-logistics-barcode.git OCA-stock-logistics-barcode
git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/stock-logistics-reporting.git OCA-stock-logistics-reporting
git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/survey.git OCA-survey
git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/timesheet.git OCA-timesheet
git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/vertical-association.git OCA-vertical-association
git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/vertical-hotel.git OCA-vertical-hotel
git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/ddmrp.git OCA-ddmrp
git clone --depth 1 --branch 11.0 --single-branch https://github.com/OCA/mis-builder.git OCA-mis-builder

sudo chown -R odoo:odoo -R /opt/odoo/addons
sudo chmod -R 775 /opt/odoo/addons

sudo -H pip3 install -r OCA-server-tools/requirements.txt
#sudo -H pip3 install -r OCA-server-ux/requirements.txt
#sudo -H pip3 install -r OCA-sale-workflow/requirements.txt
#sudo -H pip3 install -r OCA-sale-financial/requirements.txt
#sudo -H pip install -r OCA-purchase-workflow/requirements.txt
sudo -H pip3 install -r OCA-account-financial-tools/requirements.txt
sudo -H pip3 install -r OCA-account-financial-reporting/requirements.txt
#sudo -H pip3 install -r OCA-account-invoicing/requirements.txt
#sudo -H pip3 install -r OCA-account-payment/requirements.txt
#sudo -H pip3 install -r OCA-account-analytic/requirements.txt
sudo -H pip3 install -r OCA-reporting-engine/requirements.txt
#sudo -H pip3 install -r OCA-stock-logistics-workflow/requirements.txt
#sudo -H pip3 install -r OCA-stock-logistics-warehouse/requirements.txt
#sudo -H pip3 install -r OCA-knowledge/requirements.txt
#sudo -H pip3 install -r OCA-manufacture/requirements.txt
#sudo -H pip3 install -r OCA-margin-analysis/requirements.txt
#sudo -H pip3 install -r OCA-crm/requirements.txt
#sudo -H pip3 install -r OCA-hr/requirements.txt
#sudo -H pip3 install -r OCA-hr-timesheet/requirements.txt
#sudo -H pip3 install -r OCA-commission/requirements.txt
#sudo -H pip3 install -r OCA-queue/requirements.txt
#sudo -H pip3 install -r OCA-operating-unit/requirements.txt
#sudo -H pip3 install -r OCA-sale-reporting/requirements.txt

#Tiró error, REVISAR
sudo -H pip3 install -r OCA-report-print-send/requirements.txt

sudo -H pip3 install -r OCA-social/requirements.txt
#sudo -H pip3 install -r OCA-contract/requirements.txt
sudo -H pip3 install -r OCA-web/requirements.txt
#sudo -H pip3 install -r OCA-website/requirements.txt
#sudo -H pip3 install -r OCA-product-variant/requirements.txt
#sudo -H pip3 install -r OCA-product-attribute/requirements.txt
sudo -H pip3 install -r OCA-partner-contact/requirements.txt
#sudo -H pip3 install -r OCA-e-commerce/requirements.txt

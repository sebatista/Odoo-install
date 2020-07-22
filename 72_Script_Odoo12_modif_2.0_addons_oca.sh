#
# Localizacion argentina oca
#

# Crear directorios para Addons
if [ -d /opt/odoo/addons/ ] ;
then
	echo "Directorio /opt/odoo/addons/ existente"
else
	sudo mkdir /opt/odoo/addons
	echo "Directorio /opt/odoo/addons/ creado"
fi

# Crear directorios para oca
if [ -d /opt/odoo/addons/oca/ ];
then
	echo "El directorio /opt/odoo/addons/oca/ ya existe."
else
	sudo -H mkdir /opt/odoo/addons/oca
	echo "Directorio /opt/odoo/addons/oca/ creado."
fi

cd /opt/odoo/addons/oca

#--depth 1 Es para que únicamente se clone la última versión y no ocupe tanto espacio.
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/account-analytic account-analytic
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/account-closing account-closing
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/account-financial-reporting account-financial-reporting
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/account-financial-tools account-financial-tools
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/account-invoice-reporting account-invoice-reporting
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/account-invoicing account-invoicing
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/account-payment account-payment
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/account-reconcile account-reconcile
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/bank-payment bank-payment
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/commission commission
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/contract contract
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/credit-control credit-control
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/crm crm
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/currency currency
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/ddmrp ddmrp
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/donation donation
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/e-commerce e-commerce
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/event event
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/field-service field-service
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/geospatial geospatial
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/hr hr
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/hr-timesheet hr-timesheet
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/knowledge knowledge
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/manufacture manufacture
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/manufacture-reporting manufacture-reporting
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/margin-analysis margin-analysis
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/mis-builder mis-builder
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/multi-company multi-company
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/OpenUpgrade OpenUpgrade
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/operating-unit operating-unit
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/partner-contact partner-contact
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/pos pos
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/product-attribute product-attribute
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/product-variant product-variant
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/project project
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/project-reporting project-reporting
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/purchase-workflow purchase-workflow
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/queue queue
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/reporting-engine reporting-engine
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/report-print-send report-print-send
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/rma rma
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/sale-financial sale-financial
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/sale-reporting sale-reporting
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/sale-workflow sale-workflow
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/server-auth server-auth
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/server-backend server-backend
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/server-tools server-tools
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/server-ux server-ux
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/social social
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/stock-logistics-barcode stock-logistics-barcode
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/stock-logistics-reporting stock-logistics-reporting
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/stock-logistics-warehouse stock-logistics-warehouse
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/stock-logistics-workflow stock-logistics-workflow
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/survey survey
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/timesheet timesheet
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/vertical-association vertical-association
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/vertical-hotel vertical-hotel
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/web web
sudo -H git clone --depth 1 --branch 12.0 --single-branch https://github.com/OCA/website website


sudo chown -R odoo:odoo -R /opt/odoo/addons
sudo chmod -R 775 /opt/odoo/addons

pip3 install -r account-analytic/requirements.txt
pip3 install -r account-closing/requirements.txt
pip3 install -r account-financial-reporting/requirements.txt
pip3 install -r account-financial-tools/requirements.txt
pip3 install -r account-invoice-reporting/requirements.txt
pip3 install -r account-invoicing/requirements.txt
pip3 install -r account-payment/requirements.txt
pip3 install -r account-reconcile/requirements.txt
pip3 install -r bank-payment/requirements.txt
pip3 install -r commission/requirements.txt
pip3 install -r contract/requirements.txt
pip3 install -r credit-control/requirements.txt
pip3 install -r crm/requirements.txt
pip3 install -r currency/requirements.txt
pip3 install -r ddmrp/requirements.txt
pip3 install -r donation/requirements.txt
pip3 install -r e-commerce/requirements.txt
pip3 install -r event/requirements.txt
pip3 install -r field-service/requirements.txt
pip3 install -r geospatial/requirements.txt
pip3 install -r hr/requirements.txt
pip3 install -r hr-timesheet/requirements.txt
pip3 install -r knowledge/requirements.txt
pip3 install -r manufacture/requirements.txt
pip3 install -r manufacture-reporting/requirements.txt
pip3 install -r margin-analysis/requirements.txt
pip3 install -r mis-builder/requirements.txt
pip3 install -r multi-company/requirements.txt
pip3 install -r OpenUpgrade/requirements.txt
pip3 install -r operating-unit/requirements.txt
pip3 install -r partner-contact/requirements.txt
pip3 install -r pos/requirements.txt
pip3 install -r product-attribute/requirements.txt
pip3 install -r product-variant/requirements.txt
pip3 install -r project/requirements.txt
pip3 install -r project-reporting/requirements.txt
pip3 install -r purchase-workflow/requirements.txt
pip3 install -r queue/requirements.txt
pip3 install -r reporting-engine/requirements.txt
pip3 install -r report-print-send/requirements.txt # ERROR pycups
pip3 install -r rma/requirements.txt
pip3 install -r sale-financial/requirements.txt
pip3 install -r sale-reporting/requirements.txt
pip3 install -r sale-workflow/requirements.txt
pip3 install -r server-auth/requirements.txt
pip3 install -r server-backend/requirements.txt # ERROR mysqlclient
pip3 install -r server-tools/requirements.txt
pip3 install -r server-ux/requirements.txt
pip3 install -r social/requirements.txt
pip3 install -r stock-logistics-barcode/requirements.txt
pip3 install -r stock-logistics-reporting/requirements.txt
pip3 install -r stock-logistics-warehouse/requirements.txt
pip3 install -r stock-logistics-workflow/requirements.txt
pip3 install -r survey/requirements.txt
pip3 install -r timesheet/requirements.txt
pip3 install -r vertical-association/requirements.txt
pip3 install -r vertical-hotel/requirements.txt
pip3 install -r web/requirements.txt
pip3 install -r website/requirements.txt

#
# Localizacion argentina OCA
#

# Crear directorios para modulos externos
sudo -H mkdir /opt/odoo/addons/oca
cd /opt/odoo/addons/oca

sudo -H git clone https://github.com/OCA/server-tools -b 11.0 oca-server-tools
sudo -H git clone https://github.com/OCA/sale-workflow -b 11.0 oca-sale-workflow
sudo -H git clone https://github.com/OCA/sale-financial -b 11.0 oca-sale-financial
sudo -H git clone https://github.com/OCA/purchase-workflow -b 11.0 oca-purchase-workflow
sudo -H git clone https://github.com/OCA/account-financial-tools -b 11.0 oca-account-financial-tools
sudo -H git clone https://github.com/OCA/account-financial-reporting -b 11.0 oca-account-financial-reporting
sudo -H git clone https://github.com/OCA/account-invoicing -b 11.0 oca-account-invoicing
sudo -H git clone https://github.com/OCA/account-payment -b 11.0 oca-account-payment
sudo -H git clone https://github.com/OCA/account-analytic -b 11.0 oca-account-analytic
sudo -H git clone https://github.com/OCA/reporting-engine -b 11.0 oca-reporting-engine
sudo -H git clone https://github.com/OCA/stock-logistics-workflow -b 11.0 oca-stock-logistics-workflow
sudo -H git clone https://github.com/OCA/stock-logistics-warehouse -b 11.0 oca-stock-logistics-warehouse
sudo -H git clone https://github.com/OCA/knowledge -b 11.0 oca-knowledge
sudo -H git clone https://github.com/OCA/manufacture -b 11.0 oca-manufacture
sudo -H git clone https://github.com/OCA/margin-analysis -b 11.0 oca-margin-analysis
sudo -H git clone https://github.com/OCA/crm -b 11.0 oca-crm
sudo -H git clone https://github.com/OCA/hr -b 11.0 oca-hr
sudo -H git clone https://github.com/OCA/hr-timesheet -b 11.0 oca-hr-timesheet
sudo -H git clone https://github.com/OCA/commission -b 11.0 oca-commission
sudo -H git clone https://github.com/OCA/report-print-send -b 11.0 oca-report-print-send
sudo -H git clone https://github.com/OCA/social -b 11.0 oca-social
sudo -H git clone https://github.com/OCA/contract -b 11.0 oca-contract
sudo -H git clone https://github.com/OCA/web -b 11.0 oca-web
sudo -H git clone https://github.com/OCA/website -b 11.0 oca-website
sudo -H git clone https://github.com/OCA/product-variant -b 11.0 oca-product-variant
sudo -H git clone https://github.com/OCA/product-attribute -b 11.0 oca-product-attribute
sudo -H git clone https://github.com/OCA/partner-contact -b 11.0 oca-partner-contact
sudo -H git clone https://github.com/OCA/e-commerce -b 11.0 oca-e-commerce

sudo chown -R odoo:odoo -R /opt/odoo/addons
sudo chmod -R 775 /opt/odoo/addons

sudo -H pip3 install -r oca-server-tools/requirements.txt
#sudo -H pip3 install -r oca-sale-workflow/requirements.txt
#sudo -H pip3 install -r oca-sale-financial/requirements.txt
#sudo -H pip install -r oca-purchase-workflow/requirements.txt
sudo -H pip3 install -r oca-account-financial-tools/requirements.txt
sudo -H pip3 install -r oca-account-financial-reporting/requirements.txt
#sudo -H pip3 install -r oca-account-invoicing/requirements.txt
#sudo -H pip3 install -r oca-account-payment/requirements.txt
#sudo -H pip3 install -r oca-account-analytic/requirements.txt
sudo -H pip3 install -r oca-reporting-engine/requirements.txt
#sudo -H pip3 install -r oca-stock-logistics-workflow/requirements.txt
#sudo -H pip3 install -r oca-stock-logistics-warehouse/requirements.txt
#sudo -H pip3 install -r oca-knowledge/requirements.txt
#sudo -H pip3 install -r oca-manufacture/requirements.txt
#sudo -H pip3 install -r oca-margin-analysis/requirements.txt
#sudo -H pip3 install -r oca-crm/requirements.txt
#sudo -H pip3 install -r oca-hr/requirements.txt
#sudo -H pip3 install -r oca-hr-timesheet/requirements.txt
#sudo -H pip3 install -r oca-commission/requirements.txt
sudo -H pip3 install -r oca-report-print-send/requirements.txt
sudo -H pip3 install -r oca-social/requirements.txt
#sudo -H pip3 install -r oca-contract/requirements.txt
sudo -H pip3 install -r oca-web/requirements.txt
#sudo -H pip3 install -r oca-website/requirements.txt
#sudo -H pip3 install -r oca-product-variant/requirements.txt
#sudo -H pip3 install -r oca-product-attribute/requirements.txt
sudo -H pip3 install -r oca-partner-contact/requirements.txt
#sudo -H pip3 install -r oca-e-commerce/requirements.txt


cd ..
mkdir others
cd others

sudo -H git clone https://github.com/akretion/odoo-usability -b 11.0 others-akretion-odoo-usability
sudo -H git clone https://github.com/it-projects-llc/website-addons -b 11.0 others-it-projects-llc-website-addons

#sudo -H pip3 install -r others-akretion-odoo-usability/requirements.txt
sudo -H pip3 install -r others-it-projects-llc-website-addons/requirements.txt

sudo chown -R odoo:odoo -R /opt/odoo/addons
sudo chmod -R 775 /opt/odoo/addons


#
# Localizacion argentina ADHOC
#

# Crear directorios para modulos externos
sudo mkdir /opt/odoo/addons/ADHOC
cd /opt/odoo/addons/ADHOC

sudo wget https://github.com/ingadhoc/odoo-argentina/archive/11.0.zip -O ingadhoc-odoo-argentina.zip
sudo wget https://github.com/ingadhoc/account-financial-tools/archive/11.0.zip -O ingadhoc-account-financial-tools.zip
sudo wget https://github.com/ingadhoc/account-payment/archive/11.0.zip -O ingadhoc-account-payment.zip
sudo wget https://github.com/ingadhoc/aeroo_reports/archive/11.0.zip -O ingadhoc-aeroo_reports.zip
sudo wget https://github.com/ingadhoc/miscellaneous/archive/11.0.zip -O ingadhoc-miscellaneous.zip
sudo wget https://github.com/ingadhoc/argentina-reporting/archive/11.0.zip -O ingadhoc-argentina-reporting.zip
sudo wget https://github.com/ingadhoc/reporting-engine/archive/11.0.zip -O ingadhoc-reporting-engine.zip
sudo wget https://github.com/ingadhoc/argentina-sale/archive/11.0.zip -O ingadhoc-argentina-sale.zip
sudo wget https://github.com/ingadhoc/stock/archive/11.0.zip -O ingadhoc-stock.zip
sudo wget https://apps.odoo.com/loempia/download/partner_identification/11.0.1.0.0/4gXzqj52wzlBc64roBAw7v.zip -O partner_identification.zip

sudo unzip ingadhoc-odoo-argentina.zip
sudo unzip ingadhoc-account-financial-tools.zip
sudo unzip ingadhoc-account-payment.zip
sudo unzip ingadhoc-aeroo_reports.zip
sudo unzip ingadhoc-miscellaneous.zip
sudo unzip ingadhoc-argentina-reporting.zip
sudo unzip ingadhoc-reporting-engine.zip
sudo unzip ingadhoc-argentina-sale.zip
sudo unzip ingadhoc-stock.zip
sudo unzip partner_identification.zip

sudo rm ingadhoc-odoo-argentina.zip
sudo rm ingadhoc-account-financial-tools.zip
sudo rm ingadhoc-account-payment.zip
sudo rm ingadhoc-aeroo_reports.zip
sudo rm ingadhoc-miscellaneous.zip
sudo rm ingadhoc-argentina-reporting.zip
sudo rm ingadhoc-reporting-engine.zip
sudo rm ingadhoc-argentina-sale.zip
sudo rm ingadhoc-stock.zip
sudo rm partner_identification.zip

sudo chown -R odoo:odoo -R /opt/odoo/addons
sudo chmod -R 775 /opt/odoo/addons

sudo -H pip3 install pycryptodome
# original # 
# sudo -H pip3 install -r account-payment-11.0/requirements.txt
# sudo -H pip3 install -r aeroo_reports-11.0/requirements.txt
# sudo -H pip3 install -r argentina-reporting-11.0/requirements.txt
# sudo -H pip3 install -r argentina-sale-11.0/requirements.txt
# sudo -H pip3 install -r miscellaneous-11.0/requirements.txt
# sudo -H pip3 install -r odoo-argentina-11.0/requirements.txt
sudo -H pip3 install -r account-payment-11.0/requirements.txt
sudo -H pip3 install -r aeroo_reports-11.0/requirements.txt
sudo -H pip3 install -r argentina-reporting-11.0/requirements.txt
sudo -H pip3 install -r argentina-sale-11.0/requirements.txt
sudo -H pip3 install -r miscellaneous-11.0/requirements.txt
sudo -H pip3 install -r odoo-argentina-11.0/requirements.txt


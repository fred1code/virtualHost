#!/bin/bash 
# 1 nombre de la carpeta donde se guardara el hosts
# 2 correo para el hosts
# 3 nombre del hosts
# 4 ip del hosts
mkdir $1
docroot="/var/www/$1/"
host='1s/^/'$4
hosts=host'    '
cp template /etc/apache2/sites-available/"$1.conf"
sed -i 's/template.email/'$2'/g' /etc/apache2/sites-available/"$1.conf"
sed -i 's/template.url/'$3'/g' /etc/apache2/sites-available/"$1.conf"
sed -i 's#template.docroot#'$docroot'#g' /etc/apache2/sites-available/"$1.conf"
sed -i '1s/^/'$4'   '$3'\n/' /etc/hosts
a2ensite $1
/etc/init.d/apache2 reload




#!/bin/bash

#export MYSQL_PWD="-puniandeS.1"
user="cloud"
password="uniandeS.1"
id_concurso=$(mysql -u $user -p$password -se "select estado from  supervoices.Propuesta where voz_original ='static/uploadfiles/16022022235111audio5.mp3'" -B --skip-column-names)
echo $id_concurso


id_concurso="${id_concurso#"${id_concurso%%[![:space:]]*}"}"
# remove trailing whitespace characters
var="${id_concurso%"${id_concurso##*[![:space:]]}"}" 


estado2="En proceso"

if [[ $id_concurso == $estado2 ]]
then
   echo "Entró"
else
   echo "No entró"
fi

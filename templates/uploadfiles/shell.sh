#!/bin/bash

#export MYSQL_PWD="-puniandeS.1"
user="cloud"
password="uniandeS.1"
estado=""
FILES=/home/l.nivia/proyecto1/backend/static/uploadfiles/*.ogg
for f in $FILES
    do
    voz_ori="static/uploadfiles/${f:51:100}"
    voz_con="${f%.*}.mp3"
    estado=$(mysql -u $user -p$password -se "select estado from supervoices.Propuesta where voz_original = '$voz_ori'" -B --skip-column-names)
    if [[ $estado == "En proceso" ]]
		then
   			id_concurso=$(mysql -u $user -p$password -se "select id_concurso from supervoices.Propuesta where voz_original = '$voz_ori'" -B --skip-column-names)
			ffmpeg -i $f "${f%.*}.mp3"
            rm $f
            voz_con="static/uploadfiles/${voz_con:51:100}"
            mysql -u $user -p$password -se "update supervoices.Propuesta set voz_convertida='$voz_con' where voz_original='$voz_ori'"
            dest=$(mysql -u $user -p$password -se "select a.email from supervoices.Locutor a,supervoices.Propuesta b where a.id_locutor = b.id_locutor and b.estado ='$estado'")
            mysql -u $user -p$password -se "update supervoices.Propuesta set estado='Convertida' where voz_original='$voz_ori'"
            echo "Su voz ha sido convertida. consulte en: http://172.24.41.200:8080/detallarconcurso/$id_concurso" | mail -s "Supervoices - voz convertida" $dest
	else
			estado=""
	fi
    estado=""       
    done
estado="" 
FILES2=/home/l.nivia/proyecto1/backend/static/uploadfiles/*.wav
for f in $FILES2
    do
    voz_ori="static/uploadfiles/${f:51:100}"
    voz_con="${f%.*}.mp3"
    estado=$(mysql -u $user -p$password -se "select estado from supervoices.Propuesta where voz_original = '$voz_ori'" -B --skip-column-names)
    if [[ $estado == "En proceso" ]]
		then
   			id_concurso=$(mysql -u $user -p$password -se "select id_concurso from supervoices.Propuesta where voz_original = '$voz_ori'" -B --skip-column-names)
			ffmpeg -i $f "${f%.*}.mp3"
            rm $f
            voz_con="static/uploadfiles/${voz_con:51:100}"
            mysql -u $user -p$password -se "update supervoices.Propuesta set voz_convertida='$voz_con' where voz_original='$voz_ori'"
            dest=$(mysql -u $user -p$password -se "select a.email from supervoices.Locutor a,supervoices.Propuesta b where a.id_locutor = b.id_locutor and b.estado ='$estado'")
            mysql -u $user -p$password -se "update supervoices.Propuesta set estado='Convertida' where voz_original='$voz_ori'"
            echo "Su voz ha sido convertida. consulte en: http://172.24.41.200:8080/detallarconcurso/$id_concurso" | mail -s "Super voices - voz convertida" $dest
	else
			estado=""
	fi
    estado=""   
    done
estado=""
FILES3=/home/l.nivia/proyecto1/backend/static/uploadfiles/*.mp3
for f in $FILES3
    do
       voz_ori="static/uploadfiles/${f:51:100}"
       voz_con="static/uploadfiles/${f:51:100}"
     estado=$(mysql -u $user -p$password -se "select estado from supervoices.Propuesta where voz_original = '$voz_ori'" -B --skip-column-names)
    if [[ $estado == "En proceso" ]]
		then
   			id_concurso=$(mysql -u $user -p$password -se "select id_concurso from supervoices.Propuesta where voz_original = '$voz_ori'" -B --skip-column-names)
			#ffmpeg -i $f "${f%.*}.mp3"
            #rm $f
            voz_con="static/uploadfiles/${voz_con:51:100}"
            mysql -u $user -p$password -se "update supervoices.Propuesta set voz_convertida='$voz_con' where voz_original='$voz_ori'"
            dest=$(mysql -u $user -p$password -se "select a.email from supervoices.Locutor a,supervoices.Propuesta b where a.id_locutor = b.id_locutor and b.estado ='$estado'")
            mysql -u $user -p$password -se "update supervoices.Propuesta set estado='Convertida' where voz_original='$voz_ori'"
            echo "Su voz ha sido convertida. consulte en: http://172.24.41.200:8080/detallarconcurso/$id_concurso" | mail -s "Super voices - voz convertida" $dest
	else
			estado=""
	fi
    estado="" 
    done
estado="" 
chmod 777 /home/l.nivia/proyecto1/backend/static/uploadfiles/*

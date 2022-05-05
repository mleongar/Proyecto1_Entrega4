#!/bin/bash

#export MYSQL_PWD="-puniandeS.1"
user="cloud"
password="uniandeS.1"
host="dbcloud.cglc0r2vyjzj.us-east-1.rds.amazonaws.com"
port="3306"
estado=""
FILES=/home/ubuntu/proyecto1/backend/static/uploadfiles/*.ogg

for f in $FILES
    do
    voz_ori="static/uploadfiles/${f:50:100}"
    voz_con="${f%.*}.mp3"
    estado=$(mysql -h $host -P $port -u $user -p$password -se "select estado from supervoices.Propuesta where voz_original = '$voz_ori'" -B --skip-column-names)
    if [[ $estado == "En proceso" ]]
		then
   			id_concurso=$(mysql -h $host -P $port -u $user -p$password -se "select id_concurso from supervoices.Propuesta where voz_original = '$voz_ori'" -B --skip-column-names)
			ffmpeg -i $f "${f%.*}.mp3"
            #rm $f
            voz_con="static/uploadfiles/${voz_con:50:100}"
            mysql -h $host -P $port -u $user -p$password -se "update supervoices.Propuesta set voz_convertida='$voz_con' where voz_original='$voz_ori'"
            dest=$(mysql -h $host -P $port  -u $user -p$password -se "select a.email from supervoices.Locutor a,supervoices.Propuesta b where a.id_locutor = b.id_locutor and b.estado ='$estado'")
            mysql -h $host -P $port -u $user -p$password -se "update supervoices.Propuesta set estado='Convertida' where voz_original='$voz_ori'"
            

#envio de correo ogg

SUBJECT="SuperVoices - Voz Convertida";
SENDGRID_API_KEY="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"
FROM_EMAIL="l.nivia@uniandes.edu.co"
MESSAGE="Su voz ha sido convertida. consulte en: http://54.82.136.31:80/detallarconcurso/$id_concurso";
EMAIL_TO=$dest
FROM_NAME="SuperVoices"
REQUEST_DATA='{"personalizations": [{
                   "to": [{ "email": "'"$EMAIL_TO"'" }],
                   "subject": "'"$SUBJECT"'"
                }],
                "from": {
                    "email": "'"$FROM_EMAIL"'",
                    "name": "'"$FROM_NAME"'"
                },
                "content": [{
                    "type": "text/plain",
                    "value": "'"$MESSAGE"'"
                }]
}';

           # curl -X "POST" "https://api.sendgrid.com/v3/mail/send" \
           # -H "Authorization: Bearer $SENDGRID_API_KEY" \
           # -H "Content-Type: application/json" \
           # -d "$REQUEST_DATA"


	else
			estado=""
	fi
    estado=""       
    done
estado="" 

FILES2=/home/ubuntu/proyecto1/backend/static/uploadfiles/*.wav
for f in $FILES2
    do
    voz_ori="static/uploadfiles/${f:50:100}"
    voz_con="${f%.*}.mp3"
    estado=$(mysql -h $host -P $port -u $user -p$password -se "select estado from supervoices.Propuesta where voz_original = '$voz_ori'" -B --skip-column-names)
    if [[ $estado == "En proceso" ]]
		then
   			id_concurso=$(mysql -h $host -P $port -u $user -p$password -se "select id_concurso from supervoices.Propuesta where voz_original = '$voz_ori'" -B --skip-column-names)
			ffmpeg -i $f "${f%.*}.mp3"
            #rm $f
            voz_con="static/uploadfiles/${voz_con:50:100}"
            mysql -h $host -P $port -u $user -p$password -se "update supervoices.Propuesta set voz_convertida='$voz_con' where voz_original='$voz_ori'"
            dest=$(mysql -h $host -P $port -u $user -p$password -se "select a.email from supervoices.Locutor a,supervoices.Propuesta b where a.id_locutor = b.id_locutor and b.estado ='$estado'")
            mysql -h $host -P $port -u $user -p$password -se "update supervoices.Propuesta set estado='Convertida' where voz_original='$voz_ori'"
	
           
#envio de correo wav

SUBJECT="SuperVoices - Voz Convertida";
SENDGRID_API_KEY="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"
FROM_EMAIL="l.nivia@uniandes.edu.co"
MESSAGE="Su voz ha sido convertida. consulte en: http://54.82.136.31:80/detallarconcurso/$id_concurso";
EMAIL_TO=$dest
FROM_NAME="SuperVoices"
REQUEST_DATA='{"personalizations": [{
                   "to": [{ "email": "'"$EMAIL_TO"'" }],
                   "subject": "'"$SUBJECT"'"
                }],
                "from": {
                    "email": "'"$FROM_EMAIL"'",
                    "name": "'"$FROM_NAME"'"
                },
                "content": [{
                    "type": "text/plain",
                    "value": "'"$MESSAGE"'"
                }]
}';

           # curl -X "POST" "https://api.sendgrid.com/v3/mail/send" \
           # -H "Authorization: Bearer $SENDGRID_API_KEY" \
           # -H "Content-Type: application/json" \
           # -d "$REQUEST_DATA"

    
        else
			estado=""
	fi
    estado=""   
    done
estado=""
FILES3=/home/ubuntu/proyecto1/backend/static/uploadfiles/*.mp3
for f in $FILES3
    do
       voz_ori="static/uploadfiles/${f:50:100}"
       voz_con="static/uploadfiles/${f:50:100}"
     estado=$(mysql -h $host -P $port -u $user -p$password -se "select estado from supervoices.Propuesta where voz_original = '$voz_ori'" -B --skip-column-names)
    if [[ $estado == "En proceso" ]]
		then
   			id_concurso=$(mysql -h $host -P $port -u $user -p$password -se "select id_concurso from supervoices.Propuesta where voz_original = '$voz_ori'" -B --skip-column-names)
			#ffmpeg -i $f "${f%.*}.mp3"
            #rm $f
            #voz_con="static/uploadfiles/${voz_con:51:100}"
            mysql -h $host -P $port -u $user -p$password -se "update supervoices.Propuesta set voz_convertida='$voz_con' where voz_original='$voz_ori'"
            dest=$(mysql -h $host -P $port -u $user -p$password -se "select a.email from supervoices.Locutor a,supervoices.Propuesta b where a.id_locutor = b.id_locutor and b.estado ='$estado'")
            mysql -h $host -P $port -u $user -p$password -se "update supervoices.Propuesta set estado='Convertida' where voz_original='$voz_ori'"
	
SUBJECT="SuperVoices - Voz Convertida";
SENDGRID_API_KEY="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"
FROM_EMAIL="l.nivia@uniandes.edu.co"
MESSAGE="Su voz ha sido convertida. consulte en: http://54.82.136.31:80/detallarconcurso/$id_concurso";
EMAIL_TO=$dest
FROM_NAME="SuperVoices"
REQUEST_DATA='{"personalizations": [{
                   "to": [{ "email": "'"$EMAIL_TO"'" }],
                   "subject": "'"$SUBJECT"'"
                }],
                "from": {
                    "email": "'"$FROM_EMAIL"'",
                    "name": "'"$FROM_NAME"'"
                },
                "content": [{
                    "type": "text/plain",
                    "value": "'"$MESSAGE"'"
                }]
}';

           # curl -X "POST" "https://api.sendgrid.com/v3/mail/send" \
           # -H "Authorization: Bearer $SENDGRID_API_KEY" \
           # -H "Content-Type: application/json" \
           # -d "$REQUEST_DATA"

    
        else
			estado=""
	fi
    estado="" 
    done
estado="" 
chmod 777 /home/ubuntu/proyecto1/backend/static/uploadfiles/*

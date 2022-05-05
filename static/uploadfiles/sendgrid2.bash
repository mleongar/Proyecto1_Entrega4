#!/bin/bash
 
SUBJECT="SuperVoices - Voz Convertida";
SENDGRID_API_KEY="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"
EMAIL_TO="miguel.leon4@gmail.com"
FROM_EMAIL="l.nivia@uniandes.edu.co"
FROM_NAME="SuperVoices"
MESSAGE="Su voz ha sido convertida";
 
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
 
curl -X "POST" "https://api.sendgrid.com/v3/mail/send" \
    -H "Authorization: Bearer $SENDGRID_API_KEY" \
    -H "Content-Type: application/json" \
    -d "$REQUEST_DATA"

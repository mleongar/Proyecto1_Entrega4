#!/bin/bash

SENDGRID_API_KEY="U0cuWG0yOGs2clZRdml5TE96bmVfLUJSdy5iOXJjdFg4cnF4ek1vc0E0MTJKdTRvMml3Q0pwWFpTUko1dWtqS21weFVv"
EMAIL_TO="l.nivia@uniandes.edu.co"
FROM_EMAIL="miguel.leong4@gmail.com"
FROM_NAME="miguel"
SUBJECT="test"

bodyHTML="<p>Holaaaaaaa</p>"

maildata='{"personalizations": [{"to": [{"email": "'${EMAIL_TO}'"}]}],"from": {"email": "'${FROM_EMAIL}'", 
	"name": "'${FROM_NAME}'"},"subject": "'${SUBJECT}'","content": [{"type": "text/html", "value": "'${bodyHTML}'"}]}'

curl --request POST \
  --url https://api.sendgrid.com/v3/mail/send \
  --header 'Authorization: Bearer '$SENDGRID_API_KEY \
  --header 'Content-Type: application/json' \
  --data "'$maildata'"

# Voila! Sending emails from bash script is pretty simple
# 
# https://sendgrid.com/docs/API_Reference/Web_API/mail.html
# http://stackoverflow.com/questions/17029902/using-curl-post-with-variables-defined-in-bash-script-functions
# http://stackoverflow.com/questions/369758/how-to-trim-whitespace-from-a-bash-variable
# http://stackoverflow.com/questions/25217462/concatenate-output-of-sed-to-bash-script-variable
# http://stackoverflow.com/questions/13210880/replace-one-substring-for-another-string-in-shell-script
# http://stackoverflow.com/questions/22043088/how-to-get-yesterday-and-day-before-yesterday-in-linux
# http://unix.stackexchange.com/questions/157747/force-rsyslogd-to-create-new-file-before-somebody-will-write-to-it

#!/bin/bash

myDomain="ducksport.co.uk"
myHostname="@"
apiKey="insertYourApiKeyHere"
logdest="local7.info"

serverIp=`curl -s "https://api.ipify.org"`
dnsdata=`curl -s -X GET -H "Authorization: sso-key ${gdapikey}" "https://api.godaddy.com/v1/domains/${quality}/records/A/${myhostname}"`
currentIp=`echo $dnsdata | cut -d ',' -f 1 | tr -d '"' | cut -d ":" -f 2`
echo "`date '+%Y-%m-%d %H:%M:%S'` - Current External IP is $myip, GoDaddy DNS IP is $gdip"

if [ "$currentIp" != "$serverIp" -a "$myip" != "serverIp" ]; then
  echo "IP address has changed! Updating..."
  curl -s -X PUT "https://api.godaddy.com/v1/domains/${myDomain}/records/A/${myHostname}" -H "Authorization: sso-key ${apiKey}" -H "Content-Type: application/json" -d "[{\"data\": \"${serverIp}\"}]"
  logger -p $logdest "Changed IP on root.${mydomain} from ${currentIp} to ${serverIp}"
fi

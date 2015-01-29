#!/bin/bash
if [ $# -gt 0 ]; then
file="$1"
bucket="yourbucketname"
resource="/${bucket}/${file}"
contentType="application/x-compressed-tar"
dateValue=`date -u "+%a, %d %b %Y %H:%M:%S %z"`
md5=`openssl dgst -md5 -binary ${file} |openssl enc -base64`
stringToSign="PUT\n${md5}\n${contentType}\n${dateValue}\n${resource}"
s3Key="yourkey"
s3Secret="yoursecret"
signature=`echo -en ${stringToSign} | openssl sha1 -hmac ${s3Secret} -binary | openssl enc -base64`
signature1="$(printf ${stringToSign} | openssl sha1 -hmac "$s3Secret" -binary | openssl enc -base64 )"
curl -X PUT -T "${file}" \
  -H "Host: ${bucket}.s3.amazonaws.com" \
  -H "Date: ${dateValue}" \
  -H "Content-Type: ${contentType}" \
  -H "Content-MD5: ${md5}" \
  -H "Authorization: AWS ${s3Key}:${signature}" \
  https://${bucket}.s3.amazonaws.com/${file}
fi~                                                  

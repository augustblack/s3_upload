# s3_upload

A simple bash script that will upload files to S3 using curl and openssl.

It works on mac osx and should also work on other unix varients.

I made this simple script because I needed it for an older os x server and the many scripts I found only used linux-only date and base64 commands.  This one should work for .tar.gz and tar.bz2 as is.  You can modify the content type for other upload types or extend the script as needed.

# usage

```sh
./s3_upload.sh yourfile.tar.gz
```

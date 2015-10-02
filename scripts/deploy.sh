#!/usr/bin/env bash

#lftp -c "open -u $FTP_USER,$FTP_PASSWORD YOUR_FTP_HOST; set ssl:verify-certificate no; mirror -R ./ YOUR_REMOTE_PATH"

while getopts u:p:l:r:h: option
do
  case "${option}"
  in
  u) USER=${OPTARG};;
  p) PASSWORD=${OPTARG};;
  l) LOCAL=${OPTARG};;
  r) REMOTE=$OPTARG;;
  h) HOST=$OPTARG;;
esac
done

lftp -c "open -u $USER,$PASSWORD $HOST; set ssl:verify-certificate no; mirror -R ./ $REMOTE"
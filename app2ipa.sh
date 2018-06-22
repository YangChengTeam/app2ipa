#!/bin/sh
app=${1}
if [[ ${app##*.} != 'app' ]]; then
	echo 'E: extension not app'
	exit
fi
name=$(basename $app .app)
remkdir $name && cd $name
mkdir Payload
zip -r $name.ipa .

if [[ -f $name.ipa ]]; then
	echo 'I: success'
fi
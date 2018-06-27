#!/bin/sh
app=${1}
if [[ ${app##*.} != 'app' ]]; then
	echo 'E: extension not app'
	exit
fi

name=$(basename $app .app)
mkdir $name && cd $name
mkdir Payload
mv ../$app Payload
zip -r ../$name.ipa .

if [[ -f $name.ipa ]]; then
	rm -rf ../$name
	echo 'I: success'
fi

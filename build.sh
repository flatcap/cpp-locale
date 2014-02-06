#!/bin/bash

g++ -o hellogt hellogt.cpp

xgettext --package-name hellogt --package-version 1.2 --default-domain hellogt --output hellogt.pot hellogt.cpp

msginit --no-translator --locale es_MX --output-file hellogt_spanish.po --input hellogt.pot
msginit --no-translator --locale de_DE --output-file hellogt_german.po  --input hellogt.pot

sed --in-place hellogt_spanish.po --expression='/"hello, world!"/,/#: / s/""/"hola mundo"/'    --expression='/"wibble"/,/#: / s/""/"wobble"/'
sed --in-place hellogt_german.po  --expression='/"hello, world!"/,/#: / s/""/"Gutentag Welt"/' --expression='/"wibble"/,/#: / s/""/"webble"/'

mkdir --parents ./es_MX.utf8/LC_MESSAGES
mkdir --parents ./de_DE.utf8/LC_MESSAGES

msgfmt --check --verbose --output-file ./es_MX.utf8/LC_MESSAGES/hellogt.mo hellogt_spanish.po
msgfmt --check --verbose --output-file ./de_DE.utf8/LC_MESSAGES/hellogt.mo hellogt_german.po

LANGUAGE=es_MX.utf8 ./hellogt
LANGUAGE=de_DE.utf8 ./hellogt


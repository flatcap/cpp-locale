#!/bin/bash

g++ -o hellogt hellogt.cpp

xgettext --package-name hellogt --package-version 1.2 --default-domain hellogt --output hellogt.pot hellogt.cpp

msginit --no-translator --locale es_MX --output-file hellogt_spanish.po --input hellogt.pot

sed --in-place hellogt_spanish.po --expression='/"hello, world!"/,/#: / s/""/"hola mundo"/' --expression='/"wibble"/,/#: / s/""/"wobble"/'

mkdir --parents ./es_MX.utf8/LC_MESSAGES

msgfmt --check --verbose --output-file ./es_MX.utf8/LC_MESSAGES/hellogt.mo hellogt_spanish.po

LANGUAGE=es_MX.utf8 ./hellogt


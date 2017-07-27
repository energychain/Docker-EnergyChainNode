#!/bin/sh

/etc/init.d/apache2 start
cd /app/RESTService
npm update
npm start

cd /app/chainspec
parity --config stromdao_node.conf 

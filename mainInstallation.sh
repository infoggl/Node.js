#!/bin/bash

cd /tmp
#wget http://nodejs.org/dist/v0.10.32/node-v0.10.32-linux-x64.tar.gz
#tar xvf node-v0.10.32-linux-x64.tar.gz
cd node-v0.10.32-linux-x64/
cp * /usr/local/ -r
cd ~
echo -n "You now have the following version of Node installed: "
node -v
sleep 1
echo""
npm install -g express-generator
echo -n "Please enter a name for your new project and press [Enter]: "
read projectName
express $projectName
cd $projectName
npm install
sed -i -e '$ i , "devDependencies": { \n  "mocha": "*", \n  "should": ">= 0.0.1" \n } ' package.json
npm install
#mv  test test.old
mkdir test
cd test
echo -n "The current directory before creating mocha.opts: "
pwd
sleep 1
echo -e "--require should \n--ui bdd \n--recursive" > mocha.opts
cd /home/ubumtdd/$projectName
sed -i -e '$ i , "devDependencies": { \n  "mocha": "*", \n  "should": ">= 0.0.1" \n } ' package.json
sed -i -e '/scripts/ a \    "test": "node_modules/.bin/mocha -w",' package.json
npm install
cd test
echo -e "'use strict'; \n \nvar myCode = require('./code.js'); //The string on this line is the location of the file to be tes$
echo -e "'use strict';  \nvar number = 1; \nexports.outputNumber = number; \n" > code.js
npm install




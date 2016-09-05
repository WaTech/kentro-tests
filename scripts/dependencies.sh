#!/bin/bash

# export NODE_ENV=production
# export PA11Y_VERSION=1.8.2
# export PA11Y_NOINDEX=true
# export PA11Y_READONLY=true

# Install Apt packages to cacheable location
# test ! -e "/home/ubuntu/aptcache" && mkdir /home/ubuntu/aptcache || echo Success
# sudo apt-get -o dir::cache::archives="/home/ubuntu/aptcache" update; sudo apt-get -o dir::cache::archives="/home/ubuntu/aptcache" install -y libicu52
curl http://security.ubuntu.com/ubuntu/pool/main/i/icu/libicu52_52.1-3ubuntu0.4_amd64.deb > libicu52_52.1-3ubuntu0.4_amd64.deb
sudo dpkg -i libicu52_52.1-3ubuntu0.4_amd64.deb

# Update phantomjs
curl --output /home/ubuntu/bin/phantomjs-2.0.1-linux-x86_64-dynamic https://s3.amazonaws.com/circle-support-bucket/phantomjs/phantomjs-2.0.1-linux-x86_64-dynamic
chmod a+x /home/ubuntu/bin/phantomjs-2.0.1-linux-x86_64-dynamic
sudo ln -s --force /home/ubuntu/bin/phantomjs-2.0.1-linux-x86_64-dynamic /usr/local/bin/phantomjs

# Install pa11y 
# NOT RIGHT NOW
# npm i pa11y@git+https://github.com/RobLoach/pa11y.git -g
# npm i express express-hbs moment underscore chalk pa11y-reporter-1.0-json

# Install python setuptools
sudo apt-get install python-dev
wget https://bootstrap.pypa.io/ez_setup.py -O - | sudo python

# Install python modules
sudo -H pip install --upgrade pip
sudo -H pip install -U pytest beautifulsoup4 unittest-xml-reporting selenium behave requests requests_toolbelt requests[security] pyasn1 cryptography
sudo -H pip install requests[security] --upgrade

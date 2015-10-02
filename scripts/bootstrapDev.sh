#!/usr/bin/env bash
svn co https://themes.svn.wordpress.org/i-excel/1.1.4/ iexcel
git clone https://github.com/chad-thompson/vagrantpress.git development
cd development
vagrant up
cd ..
cp -avr iexcel/ development/wordpress/wp-content/themes/iexcel
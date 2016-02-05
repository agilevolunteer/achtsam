#!/usr/bin/env bash
svn co https://themes.svn.wordpress.org/i-excel/1.1.4/ iexcel
svn co http://plugins.svn.wordpress.org/events-manager/tags/5.6.2/templates/ event-manager-templates
git clone https://github.com/chad-thompson/vagrantpress.git development
cd development
vagrant up
cd ..
cp -avr iexcel/ development/wordpress/wp-content/themes/iexcel

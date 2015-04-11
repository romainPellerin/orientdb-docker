#!/bin/bash

LIP=`ifconfig eth0 | awk '{ print $2}' | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}"`
PIP=`curl ifconfig.me/ip`

echo 'Private IP: '$LIP
echo 'Public IP: '$PIP

sed -i 's/<property name="hazelcast.local.localAddress">.*/<property name="hazelcast.local.localAddress">'$LIP'<\/property>/' /opt/orientdb/config/hazelcast.xml
sed -i 's/<public-address>.*/<public-address>'$PIP'<\/public-address>/' /opt/orientdb/config/hazelcast.xml
sed -i 's/<interface>.*/<interface>'$PIP'<\/interface>/' /opt/orientdb/config/hazelcast.xml

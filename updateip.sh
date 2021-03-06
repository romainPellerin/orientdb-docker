#!/bin/bash
echo 'Private IP: '$1
echo 'Public IP: '$2
echo 'Master IP: '$3

sed -i 's/<property name="hazelcast.local.localAddress">.*/<property name="hazelcast.local.localAddress">'$1'<\/property>/' /opt/orientdb/config/hazelcast.xml
sed -i 's/<public-address>.*/<public-address>'$2'<\/public-address>/' /opt/orientdb/config/hazelcast.xml
sed -i 's/<interface>.*/<interface>'$3'<\/interface>/' /opt/orientdb/config/hazelcast.xml

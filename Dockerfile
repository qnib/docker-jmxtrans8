###### QNIBTerminal child
FROM qnib/java8
RUN export JMX_VER=$(curl -s http://central.maven.org/maven2/org/jmxtrans/jmxtrans/maven-metadata.xml |grep latest |tr -d '[[:space:]]' |sed -E 's#<(/)?latest>##g') \
 && dnf install -y http://central.maven.org/maven2/org/jmxtrans/jmxtrans/${JMX_VER}/jmxtrans-${JMX_VER}.rpm 
ADD opt/qnib/jmxtrans/bin/start.sh /opt/qnib/jmxtrans/bin/
ADD etc/supervisord.d/jmxtrans.ini /etc/supervisord.d/
ADD var/lib/jmxtrans/jvm.json /var/lib/jmxtrans/
ADD etc/consul-templates/*.ctmpl /etc/consul-templates/

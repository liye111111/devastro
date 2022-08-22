#!/bin/bash
set -e

DUBBO_IP_OPTS="-DDUBBO_IP_TO_BIND=${HOST} -DUBBO_IP_TO_REGISTRY=${HOST}"

export mode=${mode}
echo "profile: ${PROFILE}, mode=${mode}, zookeeper: ${zk_address}"

APP_OPTS="-Dapp.name=${APP_NAME:-"unknown"}"
LOG_OPTS="-Dlog.dir=${HOME}/logs"
PROFILE_OPTS="-Dspring.profiles.active=$PROFILE"
SECURITY_OPTS="-Djava.security.egd=file:/dev/./urandom"

start(){
	# java opts
	JAVA_OPTS=" -Djava.awt.headless=true -Djava.net.preferIPv4Stack=true -Djdk.serialSetFilterAfterRead=true "
	JAVA_OPTS="$JAVA_OPTS -Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=18000,server=y,suspend=n "
	JAVA_OPTS="$JAVA_OPTS -server"
	JAVA_OPTS="$JAVA_OPTS $JVM_MEM $APP_OPTS $PROFILE_OPTS $SECURITY_OPTS"


	echo "Starting the Server ..."
	echo "............"
	echo "java $JAVA_OPTS -jar /app.jar"
	java $JAVA_OPTS -jar /app.jar
}

start

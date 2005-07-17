#!/bin/sh

if [ -z "$JAVA_HOME" ]; then
    echo "You must define JAVA_HOME environment variable"
    exit 0
fi


JAVA=$JAVA_HOME/bin/java

# find out where your app is installed

basedir=`dirname $0`
savedir=`pwd`
cd $basedir
APP_HOME=`pwd`
cd $savedir

#echo "TRACE : APP_HOME = $APP_HOME"

# construct classpath
LIB_JARS=$(find $APP_HOME/lib/luxor/* -printf "%p:")
classpath=$CLASSPATH:$LIB_JARS:$APP_HOME/build/classes

#echo "TRACE : classpath=$classpath"

# run the app
$JAVA -cp $classpath  org.wyona.vanes.client.VanesLuxor $basedir/src/luxor

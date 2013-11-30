#!/bin/sh
#
# Build the module-directory-angular and the site-lutangular
#

hash npm 2>/dev/null || { echo >&2 "NPM is required for LUTANGULAR !"; exit 1; }
hash bower 2>/dev/null || { echo >&2 "BOWER is required for LUTANGULAR !"; exit 1; }
hash grunt 2>/dev/null || { echo >&2 "GRUNT is required for LUTANGULAR !"; exit 1; }

if [ -z $CATALINA_BASE ] ; then
        echo "[ERROR] Variable CATALINA_BASE is not set !"
	exit 1
fi

if [ -z $MAVEN_HOME ] ; then
	echo "[ERROR] Variable MAVEN_HOME is not set !"
	exit 1
fi

if [ -z $ANT_HOME ] ; then
	echo "[ERROR] Variable ANT_HOME is not set !"
	exit 1
fi

echo "[INFO] ------------------------------------------------------------------"
echo "[INFO] Building the Module Directory Angular"
echo "[INFO] ------------------------------------------------------------------"
cd ./module-directory-angular
mvn clean install

echo "[INFO] ------------------------------------------------------------------"
echo "[INFO] Building the site-lutangular"
echo "[INFO] ------------------------------------------------------------------"
cd ../site-lutangular
mvn clean lutece:site-assembly

echo "[INFO] ------------------------------------------------------------------"
echo "[INFO] Removing existing lutangular webapps..."
echo "[INFO] ------------------------------------------------------------------"
rm -rf $CATALINA_BASE/webapps/lutangular*

echo "[INFO] ------------------------------------------------------------------"
echo "[INFO] Copying to LUTANGULAR to $CATALINA_BASE/webapps/"
echo "[INFO] ------------------------------------------------------------------"
cp ./target/lutangular.war $CATALINA_BASE/webapps/
cp -r ./target/lutangular $CATALINA_BASE/webapps/

echo "[INFO] ------------------------------------------------------------------"
echo "[INFO] Building the database"
echo "[INFO] ------------------------------------------------------------------"
cd $CATALINA_BASE/webapps/lutangular/WEB-INF/sql/
ant

echo "[INFO] ------------------------------------------------------------------"
echo "[INFO] BUILD LUTANGULAR SUCCESS !!!"
echo "[INFO] Now start your locale Tomcat and visit http://localhost:8080/lutangular/jsp/site/Portal.jsp?page=directory-angular"
echo "[INFO] ------------------------------------------------------------------"


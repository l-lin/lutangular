LUTANGULAR
==========

This project is an example of integrating [AngularJS](http://angularjs.org/) on a [Lutece](http://fr.lutece.paris.fr/).
This project contains :
* a **module-directory-angular** that integrates the AngularJS with the plugin-directory in a Lutece XPage
    * The front-end is rendered with AngularJS. The data is fetch with WS Rest calls to the module-directory-rest.
    * For testing purpose, the *signrequest* security is disabled for the module-directory-rest
* a **site-lutangular** for building a Lutece webapps with the module-directory-angular

Getting started
===============

## Prerequisite
In order to test this project, you will need the following applications installed:
* [NodeJS](http://nodejs.org/):	A software platform used to build scalable network applications
* [BowerJS](https://github.com/bower/bower): A front-end package manager for the web that runs over Git.
* [GruntJS](http://gruntjs.com/): A Javascript Task Runner
* [Maven v3+](http://maven.apache.org/)
* [Tomcat v6+](http://tomcat.apache.org/) or your favorite servlet container
* [MySQL](http://www.mysql.fr/) or your favorite database 
* [Ant](http://ant.apache.org/)

## Get the source code of Lutangular
Clone lutangular and start working...

## Configuration
* Edit `site-lutangular/webapp/WEB-INF/conf/db.properties` 
* Insert your database information. Example (for a MySQL database):

```
portal.poolservice=fr.paris.lutece.util.pool.service.LuteceConnectionService
portal.driver=org.gjt.mm.mysql.Driver
portal.url=jdbc:mysql://localhost/lutece?autoReconnect=true&useUnicode=yes&characterEncoding=utf8
portal.user=root
portal.password=root
portal.initconns=2
portal.maxconns=50
portal.logintimeout=2
portal.checkvalidconnectionsql=SELECT 1
```

## Installing
### For Ubuntu users 
* Runs the `build_lutangular.sh` SH scripts

> **Note**: 
> * If your are compiling a Lutece project for the first time, it might time a while. So you can go grab a cup of coffee and come back in 10~min ;)
> * This `build_lutangular.sh` SH scripts has only been tested in Ubuntu 13.10
> * If you are behind a proxy, you might also have some problems fetching bower components...

* Runs Tomcat
* Go to `http://localhost:<port>/lutangular/jsp/site/Portal.jsp?page=directory-angular`

### For windows users
* Open a Command Prompt (`ctrl+r` then `cmd`)
* Go to the lutangular project directory root
* Execute the following commands

```
c:\pathtolutangular> cd module-directory-angular
c:\pathtolutangular\module-directory-angular> mvn clean install
c:\pathtolutangular\module-directory-angular> cd ..
c:\pathtolutangular> cd site-lutangular
c:\pathtolutangular\site-lutangular> mvn lutece:site-assembly
c:\pathtolutangular\site-lutangular> cd target\lutangular\WEB-INF\sql
c:\pathtolutangular\site-lutangular\target\lutangular\WEB-INF\sql> ant
```

> **Note**: 
> * If your are compiling a Lutece project for the first time, it might time a while. So you can go grab a cup of coffee and come back in 10~min ;)
> * If you are behind a proxy, you might also have some problems fetching bower components...

* It will generate a war file in `c:\path_to_lutangular\site-lutangular\target`. Copy this war into your Tomcat webapps directory
* Runs Tomcat
* Go to `http://localhost:<port>/lutangular/jsp/site/Portal.jsp?page=directory-angular`

About this project
==================

The **module-directory-angular** has been created using [Yeoman](http://yeoman.io/) and the [Maven Yeoman plugin](https://github.com/trecloux/yeoman-maven-plugin).
Thanks to these tools, it is now possible to create, build, preview and test JS applications and we no longer have to manually download and manage libraries.
It is also possible to include full JS project into the lifecycle of a Java web application.

## module-directory-angular/yo directory layout

```
yo/                 --> the source code of the JS Angular application (build with yeoman)
    app/                --> all of the files to be used in production
      angular.html      --> app layout file (the main html template file of the app)
      scripts/          --> javascript files
        app.js          --> application
    
    test/               --> test source files and libraries
      spec/                     --> unit level specs/tests
        app.js                      --> specs for controllers
        
    bower.json          --> BowerJS package management description
    Gruntfile.js        --> GruntJS tasks configuration
    karma.conf.js       --> config file for running unit tests with Karma
    package.json        --> NodeJS package management description
```

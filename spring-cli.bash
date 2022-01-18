#!/usr/bin/bash

RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

javaVersion=""

if [ -z $1 ] || [ $1 = "--help" ]; then
    echo -e "${YELLOW}spring-cli${NC}: A command-line tool to generate spring projects right from your terminal"
    printf "\n${BLUE}Usage${NC}: \n\tspring-cli {option}\n"
    printf "${BLUE}Options${NC}: \n\t--help\t\t\t\tPrint this help message\n\t--list-dependencies\t\tList all dependencies\n"
    echo

    #Begin project generation
elif [ $1 = "--create-project" ]; then
    # echo -e "${GREEN}Enter project name:${NC} "
    # read -p "(default=DemoApplication) ==> " applicationName
    # echo
    # if [ -z $applicationName ]; then 
    #     applicationName="DemoApplication"
    # fi

    echo -e "Enter artifactId"
    read -p "(default=demo) ==> " artifactId
    echo
    if [ -z $artifactId ]; then
        artifactId="demo"
    fi

    echo -e "Enter Spring Boot Version:"
    read -p "(default=2.6.2) ==> " springBootVersion
    echo
    if [ -z $springBootVersion ]; then
        springBootVersion="2.6.2"
    fi
    
    echo -e "Enter dependencies (comma seperated):"
    read -p "(default = none) ==> " dependencies
    echo
    if [ -z $dependencies ]; then
        dependencies=""
    fi

    echo -e "Enter description:" 
    read -p "(default = Demo project for spring boot) ==> " description
    echo
    if [ -z $description ]; then
        description="Demo project for spring boot."
    fi

    echo -e "Enter groupId:"
    read -p "(default = com.example) ==> " groupId
    echo
    if [ -z $groupId ]; then
        groupId="com.example"
    fi

    echo -e "Enter language: 1) Java 2) Kotlin 3) Groovy"
    read -p "(default = 1) ==> " language
    if [ -z $language ] || [ $language = 1 ]; then
        language=java
        echo -e "\nEnter Java Version: 1) java-8 2) java-11 3) java-17"
        read -p "(default = 2) ==> " javaVersion
        echo
        if [ -z $javaVersion ]; then
            javaVersion=11
        elif [ $javaVersion = 1 ]; then
            javaVersion=8
        elif [ $javaVersion = 2 ]; then
            javaVersion=11
        elif [ $javaVersion = 3 ]; then
            javaVersion=17;
        else
            echo -e "Valid Java version not selected, using default value (11)"
            javaVersion=11
        fi
    elif [ $language = 2 ]; then
        language="kotlin"
        echo
    elif [ $language = 3 ]; then
        language="groovy"
        echo
    else
        echo -e "Valid language not selected, using default value (Java)"
    fi

    echo -e "Select Packaging 1) JAR 2) WAR"
    read -p "Enter selection (default = 1) ==> " packaging
    echo
    if [ -z $packaging ] || [ $packaging = 1 ]; then
        packaging="jar"
    elif [ $packaging = 2 ]; then
        packaging="war"
    else
        echo -e "Valid packaging not selected, using default value(JAR)"
        packaging="jar"
    fi

    echo -e "Select project-type 1) maven 2) gradle"
    read -p "Enter selection (default = 1) ==> " ptype
    echo
    if [ -z $ptype ] || [ $ptype = 1 ]; then
        ptype="maven-project"
    elif [ $ptype = 2 ]; then
        ptype="gradle-project"
    else
        echo -e "Valid project-type not selected, using default value (maven)"
        ptype="maven"
    fi

    echo -e "Enter version:"
    read -p "(default = 0.0.1-SNAPSHOT) ==> " projectVersion
    echo
    if [ -z $projectVersion ]; then
        projectVersion="0.0.1-SNAPSHOT"
    fi

    echo Generating project...
    sleep 2

    echo $artifactId
    echo $springBootVersion
    echo $description
    echo $dependencies
    echo $groupId
    echo $language
    echo $javaVersion
    echo $packaging
    echo $ptype
    echo $projectVersion

    if [ $language = "java" ]; then
        http https://start.spring.io/starter.zip \
            artifactId==$artifactId \
            bootVersion==$springBootVersion \
            dependencies==$dependencies \
            description=="$description" \
            groupId==$groupId \
            javaVersion==$javaVersion \
            type==$ptype \
            packaging==$packaging \
            version==$version -d
    else
        http https://start.spring.io/starter.zip \
            artifactId==$artifactId \
            bootVersion==$springBootVersion \
            dependencies==$dependencies \
            description=="$description" \
            groupId==$groupId \
            javaVersion==$javaVersion \
            language==$language \
            type==$ptype \
            packaging==$packaging \
            version==$version -d
    fi
fi

















# Damn Vulnerable Infrastructure (DVI)

## Introduction

This project realizes a Damn Vulnerable Infrastructure with many vulnerable containers. It allows, and actually requires, the attacker to perform various lateral movements in order to reach its goal.

The system implements the Energy Management System (EMS) of Campus Savona at Università di Genova. For the full description refer to the Guide.

The attacker will get in the system through the web server. Exploring the website will give the user the ability to gain open source intel about the infrastructure, its goal, some of the components and some key insights useful for later attack steps.

The whole system runs inside a Docker-in-Docker container (dind). It is possible to run it directly on the host by simply executing the compose file inside the directory DVI_dind.

## Guide and Solution

Full guide available at [GUIDE.md](./GUIDE.md)

## Requirements

Makefile is used to perform all actions on the system.

Docker and Docker Compose version >=2.30.0 are required.

### Specific requirements of containers

Containers must have access to the following commands: *ping*, *ip*. This is to perform healthchecks and setup each container during startup.

The Windows container requires internet access to download the ISO. Remember to let it connect to internet without limiting the firewalls.

If you want to extend the network adding a container make sure that these commands are available. Instructions to extend the infrastructure are given below.

## Steps to run

- *make up* (runs the dind)

- *make dvi-build* (builds all the containers)

- *make dvi-start* (starts dovesnap service and all the containers), if for some reason this process is not able to start correctly all the infrastructure you should execute *make dvi-down* and then repeat *make dvi-start*

- *make dvi-ps* (alias for docker compose ps inside dind)

### Steps to pause/unpause

There is the possibility to pause and unpause all the containers. It is useful to pause instead of stop because the starting process might not be reliable. This way you can be sure that everything will continue working after pause/unpause.

## Instructions to extend

TODO

## Vulnerabilities

<details>
  <summary>Spoiler Alert</summary>

 - Web: RCE (Reverse shell)

 - ScadaLTS: Privilege Escalation, RCE  (CVE-2022-41976, CVE-2023-33472 https://hev0x.github.io/posts/scadalts-cve-2023-33472/) 

 - Enterprise DB: Improper Authentication (CVE-2012-2122)

 - Windows: RCE (CVE-2019-0708)

 - OpenPLC: RCE (CVE-2024-34026)

 - WingFTP: RCE (CVE-2025-47812 https://www.exploit-db.com/exploits/52347)

</details>


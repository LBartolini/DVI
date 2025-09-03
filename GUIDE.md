# Guide and Solutions

## Campaign Start and Rules

This section explains how to start you campaign against DVI. It will also show the rules you must follow regarding what you can do and what you can't do.

## Difficulty Chooser

Choose the Difficulty for your campaign against DVI. Inside, you will find all the information you are given to start. Choosing harder difficulties means you will receive less information compared to easier ones. 

Note: all the useful information are also accessible inside DVI! This is just for convenience and to facilitate the users. Also here you will find some guidelines and possible objectives to reach.

We suggest that you to start from the hardest difficulty, Impossible, and only look at easier ones if you are not able to continue.

#### Difficulties:

- <details>
  <summary>IMPOSSIBLE</summary>
  
  Network Scheme: None

  Start your journey inside DVI at *localhost:5000*.

  There are no more information given for you.

  Good Luck!

</details>

- <details>
  <summary>HARD</summary>
  Network Scheme:

  ![](./_readme_images/network_hard.png)

</details>

- <details>
  <summary>MEDIUM</summary>
  Network Scheme:

  ![](./_readme_images/network_medium.png)

</details>

- <details>
  <summary>EASY</summary>
  Network Scheme:

  ![](./_readme_images/network_easy.png)

  The attacker will get in the system through the web server. Exploring the website will give the user the ability to gain open source intelligence about the infrastructure, some hints about the network layout, some of the key nodes and some tips that might be useful for later attack steps.

</details>

- <details>
  <summary>VERY EASY</summary>
  Network Scheme:

  ![](./_readme_images/network_very_easy.png)

</details>

## Vulnerabilities

This section contains the full list of vulnerabilities present inside DVI. Some refer to a specific CVE code and a couple also contain a link to known exploits.

For the true experience with DVI, you are asked NOT to read this section. If you feel lost you can come back here after trying for a while by yourself.

<details>
  <summary>Spoiler Alert</summary>

 - Web: RCE ([Exploit](./DVI_dind/framework/web/README.md))

 - ScadaLTS: Privilege Escalation, RCE  (CVE-2022-41976, CVE-2023-33472 https://hev0x.github.io/posts/scadalts-cve-2023-33472/) 

 - Enterprise DB: Improper Authentication (CVE-2012-2122)

 - Windows: RCE (CVE-2019-0708)

 - OpenPLC: RCE (CVE-2024-34026)

 - WingFTP: RCE (CVE-2025-47812 https://www.exploit-db.com/exploits/52347)

</details>

## Solutions

This section contains the credentials, the steps and other tips necessary to solve the scenario.

It shows possible goals/objectives with attack steps to reach them. Note that you can also come up with your own objectives.

Open and read this only after trying to solve DVI yourself.

<details>
  <summary>Spoiler Alert</summary>

</details>

## Debug/Management

This section contains all the Debug/Management data and entrypoints.

DO NOT refer, use or rely on ANY of the information written here for you campaign against DVI. Everything you find here is to be used for debug.

<details>
  <summary>Spoiler Alert</summary>
  Services associated to Ports exposed:

      - 5000:5000 # Web
      - 5001:5001 # scada -> User: admin, Pass: admin
      - 5002:5002 # bpmn viewer -> User: admin, Pass: admin
      - 5003:5003/tcp # Windows RDP -> User: Docker, Pass: admin
      - 5003:5003/udp # Windows RDP
      - 5004:5004 # Windows VNC
      - 5005:5005 # [Empty]
      - 5006:5006 # FTP Admin 5466 -> User: admin Pass: wingftp
      - 8081:8081 # LuCI perimeter -> No User/Pass required
      - 8082:8082 # LuCI enterprise -> No User/Pass required
      - 8083:8083 # LuCI industrial -> No User/Pass required

  All these services, apart from Web at port 5000, are NOT TO BE USED during your activities inside DVI.

  BUT, if you want to check at those before/after/during your campaing, you can do this accessing *localhost:PORT*.
</details>
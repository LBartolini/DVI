# Guide and Solutions

## Campaign Start and Rules

This section explains how to start you campaign against DVI. It will also show the rules you must follow regarding what you can do and what you can't do.

## Difficulty Chooser

Choose the Difficulty for your campaign against DVI. Inside, you will find all the information you are given to start. Choosing harder difficulties means you will receive less information compared to easier ones. 

The objectives to achieve are multiple, note that for harder difficulties you will not receive specific goals; you and your imagination are free to do what you want, from data exfiltration to denial of service and many more. Try to act and behave like a real hacker and find interesting goals to reach. if you choose easier difficulties you will receive some initial hints and suggestions.

Note: all the useful information are also accessible inside DVI! This is just for convenience and to facilitate the users. Also here you will find some guidelines and possible objectives to reach.

We suggest that you to start from the hardest difficulty, Impossible, and only look at easier ones if you are not able to continue.

All the information given for harder difficulties also apply for easier ones. This means that if you plan to play in Easy you have to read Impossible, Hard, Medium and finally Easy. Every level adds some more information to levels above.

After choosing the difficulty, please read the next section regarding the Rules.

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

  ![](./_readme_images/network_hard.png)

  The Network Scheme shows the Perimeter Router. You already know that there is a service at port 5000. That service is the Campus Website. It hosts some services for students as well as news and other useful information. 
  
  Looking at the schema there might be other servers inside the DMZ subnetwork and possibly also other subnetworks...

  Your first objective is to gain as much knowledge of the system as possible. The end goal is still unknown, maybe you will find something useful in the website. Find your way into the system through it and continue your work inside.

</details>

- <details>
  <summary>MEDIUM</summary>

  ![](./_readme_images/network_medium.png)

  Now you can take a look at the full DMZ subnetwork. You should check them for possible vulnerabilities or information on the network. Notice that there is a firewall next, if it is configured well it will be impossible to continue deeper, but what if it isn't...

  Now you can see that there is another subnetwork with a Windows machine, a database and another interesting service...

  Now that you have more to work with you can imagine your next moves. That database and Windows workstation surely hold confidential data, you should try to hack them. Also that other server might be crucial for future steps, explore the network and find what that server is.

  Looking at the schema it seems that there might be more in the network...

</details>

- <details>
  <summary>EASY</summary>

  ![](./_readme_images/network_easy.png)

  The full network schema shows the three subnetworks. 
  
  The DMZ net with three services used for the initial phase of the attack. Exploiting the webserver is the first step of you campaign, it is the only service exposed to the internet. The next step is the FTP server, the Enterprise Firewall has a small misconfiguration that allows traffic from FTP.

  Looking at the Enterprise Net, there are many objectives. The Windows Workstation can be a suitable end objective with the aim of stealing sensible information about the system. If instead you want to perform a more destructive attack you should investigate more the Scada and Ditto services and the ones linked to them. Also understanding how the BPMN service comes into play is crucial.

</details>

- <details>
  <summary>VERY EASY</summary>

  ![](./_readme_images/network_very_easy.png)

  The schema here shows the individual IPs for all the important hosts and networks.

  The following are the proposed objectives, solutions can be found in the Solutions section.

  TODO

</details>

## Rules

TODO

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

TODO

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
# Guide and Solutions

TODO: different levels of difficulty based on how much information is given. No help for hardest difficulty, progressively more info. The easies level should contain info about the network infrastructure such as layout and ip addresses.

TODO: Suggested goals of attack with their solutions

## Difficulty Chooser

Choose the Difficulty for your campaign against DVI. Inside, you will find all the information you are given to start. Choosing harder difficulties means you will receive less information compared to easier ones. 

Note: all the useful information are accessible inside DVI! This is just for convenience. Also here you will find some guidelines and possible objectives to reach.

Attention, SPOILER ALERT!

- <details>
  <summary>Difficulty: IMPOSSIBLE</summary>
  Network Scheme: None

  Start your journey inside DVI at *localhost:5000*. Good luck!

</details>

- <details>
  <summary>Difficulty: HARD</summary>
  Network Scheme:

  ![](./_readme_images/network_hard.png)

</details>

- <details>
  <summary>Difficulty: MEDIUM</summary>
  Network Scheme:

  ![](./_readme_images/network_medium.png)

</details>

- <details>
  <summary>Difficulty: EASY</summary>
  Network Scheme:

  ![](./_readme_images/network_easy.png)

</details>

- <details>
  <summary>Difficulty: VERY EASY</summary>
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

## Debug/Management

This section contains all the Debug/Management data and entrypoints.

DO NOT refer, use or rely on ANY of the information written here for you campaign against DVI. Everything you find here is to be used for debug.

<details>
  <summary>Spoiler Alert</summary>

</details>
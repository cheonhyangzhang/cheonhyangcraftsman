# How to see login activities
```
last
```
example output
```
gakki  pts/1   <some_ip_address>     Tue Feb  4 10:34   still logged in
gakki  pts/0   <some_ip_address>    Tue Feb  4 10:33   still logged in
reboot   system boot  <some_ip_address>    Tue Feb  4 10:30 - 10:39  (00:09)
```
First column is who are the user.

Second column is how user is connected.
pts/0 means user is connected via remote connections such as SSH or telnet. Reboot activity will be shown as system boot.

Third column show where the user come from. If the user connect from remote computer,
you will see a hostname or an IP Address.
If you see :0.0 or nothing it means that the user is connect via local terminal.
Exception for reboot activity, the kernel version will be shown as the status

Remaining columns display when the log activity was happened.
Numbers in the bracket tell us how many days and hours and minutes the connection was happened.

## Useful options
### shift the ip address column to the right most,
`last -a`
### limit the number of line to show
`last -n 3`
### display the full login and logout time and dates
`last -F`
### trace specific user
`last gakki`
### hide hostname
`last -R`
### clear last command history
remove file `/var/log/wtmp`

## Shutdown case
`last -R`
```
gakki  pts/0        Tue Feb  4 09:43 - still logged in
reboot   system boot  Tue Feb  4 09:40 - 11:37  (01:57)
gakki  pts/0        Mon Feb  3 17:59 - 18:03  (00:03)
gakki  pts/4        Mon Feb  3 16:21 - crash  (17:19)
gakki  pts/0        Mon Feb  3 12:57 - 17:58  (05:00)
```
In this example, the server is shutdown due to power outage in the evening of Feb 3.
The actual time is not possible to tell from this log.
pts/4 line shows crash as the endtime indicates a unusual shutdown.
The duration 17:19 is not telling the session is shutdown at 16:21 + 17:19 = 09:40 next day.
It happens to be the reboot time of the system.




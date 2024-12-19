Greetings earthings! 
  The following processes will help give basic security functionality to a Linux server to prevent malicious threat actors. The first step of this process is to note the system’s basic information such as system name, OS version, memory, and uptime. After this you’ll run a Backup using Tar that will exclude specific folders like /etc/temp and /etc/dev. 
 Next you will Audit the users and groups to remove old user accounts and groups, add new users and groups, and ensure only active users have their accounts unlocked. This can be done with del/adduser, delgroup, groupadd, passwd, and usermod commands. To update and enforce password policies you edit the /etc/pam.d/common-passwd file to include minimum length, number, uppercase, special character requirements as well as max password retry attempts.
 From here you look at the sudoers file to ensure only the users you want have permissions and if any users need sudo permissions for specific files/directories. To better update permissions for files and directories you should ensure that no user has any files that have world permissions to read, write, and execute as well as ensuring there are no hidden passwords. This can be done with the following two commands: 

#Sudo find /home -type f -perm /o=rwx -exec chmod o-rwx {} ;
#find /home/* -type f -name ‘.*’ -exec rm {} \;

For the next phase you will secure SSH by auditing the /etc/ssh/sshd_config file. You will change the settings to not permit empty passwords, root login, and ensure you only operate ssh through port 22. Keeping a system up to date is a crucial aspect of cybersecurity, especially to protect from known vulnerabilities. You can run apt upgrade -y.
	You can check any potentially risky packages that are installed with apt list –installed and remove them with apt autoremove -y. Two packages you want to remove would be telnet and rsh-client. Both of these connection types are unencrypted and vulnerable to man-in-the-middle attacks. Some helpful packages to add would be ufw (manages firewall rules) Lynis (auditing linux) and tripwire (monitors system changes). 
	It is beneficial to set up logging to help with forensics in case there is a breach on your system. By editing /etc/systemd/journald.conf  to change storage to persistent and systemMaxUse to 300m you can start collecting better logs. In order to prevent logs from taking up too much space you want to rotate logs. By editing the /etc/logrotate.conf file you can enable log rotation from weekly to daily and ensure logs get rotated every 7 days. 
 
Additionally you can schedules these jobs to run via cron...

At the start of each month:
0 0 1 * * /path/to/script1

Weekly on Mondays:
0 0 * * 1 /path/to/script2

Stay safe and stay savy. 

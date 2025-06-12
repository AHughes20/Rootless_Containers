#This script creates rootless containers with user specified bind-mounts.

#Please keep in mind that specifying a bind-mount outside the user's home directory will not be allowed as that would require SELinux relabling and other permissions changes which would require elevated privileges and defeats the purpose of this script.

#Also, although you are prompted to bind ports, those ports will need to be opened on the firewall, which again requires elevated privileges.



#!/bin/bash

# The below command prints the amount of free memory on the system 
free -m > ~/backups/freemem/free_mem.txt.

# The below command prints disk usage 
du -h > ~/backups/diskuse/disk_usage.txt.


# The below command lists all open files
lsof > ~/backups/openlist/open_list.txt.


# The below command prints file system disk space statistics
df > ~/backups/freedisk/free_disk.txt.



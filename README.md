# Backup script

A shell script for backing up your files.

---

## The story

I love Mac's TimeMachine, it automatically backs up my files, but for some reason I'm not using it in my working laptop, so I created a simple shell script for backing up my data.

## Usage

This script accepts three parameters:

1. Target folder/file you want to backup.
2. Destination folder you want to store your backups.
3. Maximum days for keeping you backups, if you set it to 10 this script will delete all your backups in 10 days ago.

Example:

```shell
./backup.sh ~/Projects/Demo ~/Dropbox/Backups 10
```

It will compress the `~/Projects/Demo` folder to a single `tar.gz` file and store it in `~/Dropbox/Backups` then delete all the backups in 10 days ago.

## Scheduled backups

### Mac

### Linux

## LICENSE

![](http://www.wtfpl.net/wp-content/uploads/2012/12/wtfpl-badge-1.png)

[Do What the Fuck You Want to Public License](http://www.wtfpl.net/)

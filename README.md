# Backup script

A shell script for backing up your files.

---

## The story

I love Mac's TimeMachine, it automatically backs up my files, but for some reason I'm not using it in my working laptop, so I created a simple shell script for backing up my data in my working laptop.

## Usage

This script accepts three parameters:

1. Target folder/file you want to backup.
2. Destination folder you want to store your backups.
3. Maximum days for keeping you backups, if you set it to 10, this script will delete all your backups in 10 days ago.

Example:

```shell
./backup.sh ~/Projects/Demo ~/Dropbox/Backups 10
```

It will compress the `~/Projects/Demo` folder to a single `tar.gz` file and store it in `~/Dropbox/Backups` then delete all the backups in 10 days ago.

## Scheduled backups

We can use launchd(macOS) or cron(Linux) to backup our data in a specific time.

Assume we want automatic backup `~/Project` to `~/Dropbox/Backups` at 10:00PM in every day.

### launchd(macOS)

**1. Create a launchd config file for this task.**

Save the following code snippet as `com.tonni.BackupProjectsToDropbox.plist` in `~/Library/LaunchAgents/`.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.tonni.BackupProjectsToDropbox</string>
    <key>LowPriorityIO</key>
    <true/>
    <key>ProgramArguments</key>
    <array>
        <string>/Users/Tonni/.Backup-script/backup.sh</string>
        <string>/Users/Tonni/Project</string>
        <string>/Users/Tonni/Dropbox/Backups</string>
        <string>3</string>
    </array>
    <key>RunAtLoad</key>
    <false/>
    <key>StartCalendarInterval</key>
    <array>
        <dict>
            <key>Hour</key>
            <integer>22</integer>
            <key>Minute</key>
            <integer>00</integer>
        </dict>
    </array>
</dict>
</plist>
```

> **Note:**

> - Use absolute path in config file.
> - Keep the `Label` value and the filename alike.

**2. Load the new launchd config.**

`$ launchctl load com.tonni.BackupProjectsToDropbox.plist`.

### Linux

## LICENSE

![](http://www.wtfpl.net/wp-content/uploads/2012/12/wtfpl-badge-1.png)

[Do What the Fuck You Want to Public License](http://www.wtfpl.net/)

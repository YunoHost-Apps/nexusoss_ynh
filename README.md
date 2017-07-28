# nexusoss_ynh
[![Build Status](https://travis-ci.org/YunoHost-Apps/nexusoss_ynh.svg?branch=master)](https://travis-ci.org/YunoHost-Apps/nexusoss_ynh)

sonatype nexus repository manager OSS for yunohost

## Installation

You can either :

* Install from the Yunohost Admin web interface, by providing this URL: `https://github.com/YunoHost-Apps/nexusoss_ynh`
* Install from the command-line: `yunohost app installhttps://github.com/YunoHost-Apps/nexusoss_ynh`

After the installation you can log in via the selected domain/path combination and the default admin user.
See [Chapter 4.1](https://books.sonatype.com/nexus-book/3.0/reference/admin.html) of the Nexus Documentation for further information.

## Backup information

Backup stores:

- nexus app dir
- nexus sonatype-workdir (sibling to app dir)
- nginx configuration
- systemd service configuration


# Ansible Role: mythtv

An Ansible role that installs MythTV on Fedora.

It installs and configures `mythbackend` and `mythweb`. The role currently doesn't support installing `mythfrontend`.

## Requirements

The UnitedRPMs or rpmfusion-free repository has to be installed before running this role.
Also MySQL/MariaDB, nginx and php have to be installed beforehand. To achieve this the following roles can be used:
- mjanser.mysql
- mjanser.nginx
- mjanser.php

## Role Variables

Available variables are listed below, along with default values:

    mythtv_database_password: secret
    mythtv_restore_database: ~

    mythtv_mythweb: true
    mythtv_mythweb_hostname: localhost
    mythtv_mythweb_allowed_network: "{{ ansible_default_ipv4.network|default('192.168.1.0') }}/{{ ('192.168.1.0/' ~ ansible_default_ipv4.netmask|default('255.255.255.0'))|ipaddr('prefix') }}"

    mythtv_backup: true
    mythtv_backup_directory: /var/lib/backup/mythtv

### Database

The user for accessing the database is always `mythtv`. The password can be set with the variable `mythtv_database_password`.

If you define a path to an existing SQL file in the variable `mythtv_restore_databaase`, this file will be imported
after creating the database.

### Mythweb

The installation of `mythweb` can be enabled or disabled with the variable `mythtv_mythweb`.

The variable `mythtv_mythweb_hostname` defines the hostname which will be configured in the nginx configuration.
Make sure the server is accessable from the network with this name.

By default access to `mythweb` is restricted to the local network. This can be adjusted with the variable `mythtv_mythweb_allowed_network`.

### Backup

If backup is enabled (`mythtv_backup`), a systemd timer will be installed which regularily runs the backup script of MythTV.
The backup is stored in the directory defined in the variable `mythtv_backup_directory`.

## Dependencies

None

## Example Playbook

    - hosts: all
      roles:
        - { role: mjanser.mythtv }
      vars:
        mythtv_mythweb_hostname: mythweb.example.com

## License

MIT

# Ansible Role: mythtv

An Ansible role that installs MythTV on Fedora.

## Requirements

The UnitedRPMs or rpmfusion-free repository has to be installed before running this role.
Also MySQL/MariaDB, nginx and php have to be installed beforehand. To achieve this the following roles could be used:
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

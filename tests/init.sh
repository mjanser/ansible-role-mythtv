#!/bin/bash

export PYTHONUNBUFFERED=1
export ANSIBLE_FORCE_COLOR=1
export DEBIAN_FRONTEND=noninteractive

if ! which ansible &>/dev/null; then
    echo "Installing Ansible"
    dnf install --enablerepo updates-testing -q -y ansible python-dnf python-mysql libselinux-python python-netaddr libsemanage-python >/dev/null || exit 1
fi

cd /vagrant/ansible-role-mythtv/tests

echo "127.0.0.1" > /etc/ansible/hosts
echo "localhost" > /etc/ansible/inventory
echo -e "[defaults]\nroles_path = /vagrant" > /etc/ansible/ansible.cfg

. test.sh $@

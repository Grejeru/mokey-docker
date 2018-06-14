#!/bin/bash

# Create necessary keytab directory
/usr/bin/mkdir -p /etc/mokey/keytab

# Enroll container to IPA
/usr/sbin/ipa-client-install -U --principal admin \
                                --password 'password' \
                                --domain <example.com> \
                                --realm <EXAMPLE.COM> \
                                --server <ipa.example.com> \
                                --force-join \
                                --no-ntp \
                                --no-ssh \
                                --no-sshd \
                                --no-nisdomain \
                                --noac \
                                --no-sssd \
                                --log-file /ipa-client-install.log
# kinit admin user
echo "password" | kinit admin
# Retrieve keytab for mokeyapp
/usr/sbin/ipa-getkeytab -s <ipa.example.com> -p mokeyapp -k /etc/mokey/keytab/mokeyapp.keytab

# Run mokey application
/usr/bin/mokey --debug server

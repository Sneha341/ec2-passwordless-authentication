#!/bin/bash

useradd -m -s /bin/bash ${username}
mkdir -p /home/${username}/.ssh

echo "${public_key}" > /home/${username}/.ssh/authorized_keys

chmod 700 /home/${username}/.ssh
chmod 600 /home/${username}/.ssh/authorized_keys

chown -R ${username}:${username} /home/${username}/.ssh

echo "${username} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${username}
chmod 440 /etc/sudoers.d/${username}

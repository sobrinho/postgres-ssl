#!/bin/bash -e

# Create the SSH directory
mkdir -p /var/lib/postgresql/.ssh
chmod 700 /var/lib/postgresql/.ssh

# Authorize the known public keys
echo "$SSH_AUTHORIZED_KEYS" > /var/lib/postgresql/.ssh/authorized_keys

chmod 600 /var/lib/postgresql/.ssh/authorized_keys

exec tmate \
  -k "$TMATE_API_KEY" \
  -n "$TMATE_SESSION_TOKEN" \
  -a /var/lib/postgresql/.ssh/authorized_keys

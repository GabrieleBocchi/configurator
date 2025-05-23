#!/usr/bin/env sh

set -e

# Pull latest changes
git fetch --all --prune
git reset --hard "$(git symbolic-ref --short refs/remotes/origin/HEAD)"

# Run ansible playbook
if [ -z "$ANSIBLE_VAULT_PWD" ]; then
    ansible-playbook "$REPOSITORY_PATH$ANSIBLE_PLAYBOOK_PATH" \
        --inventory "$REPOSITORY_PATH$ANSIBLE_INVENTORY_PATH"
else
    echo "$ANSIBLE_VAULT_PWD" | ansible-playbook "$REPOSITORY_PATH$ANSIBLE_PLAYBOOK_PATH" \
        --inventory "$REPOSITORY_PATH$ANSIBLE_INVENTORY_PATH" \
        --ask-vault-pass
fi

#!/usr/bin/env sh

set -e

# Clone repository
if [ ! -d "$REPOSITORY_PATH" ]; then
    GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=accept-new" git clone "$REPOSITORY_URL" "$REPOSITORY_PATH"
fi

cd "$REPOSITORY_PATH"

# Run custom script if it exists
if [ -z "$CUSTOM_SCRIPT_PATH" ]; then
    "$CUSTOM_SCRIPT_PATH"
fi

# Start webhook
/usr/local/bin/webhook -verbose "$(find "$HOOKS_DIR" -type f -exec printf -- '-hooks=%s ' {} \;)" -hotreload -template

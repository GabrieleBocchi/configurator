#!/usr/bin/env sh

set -e

# Run custom script if it exists
if [ -z "$CUSTOM_SCRIPT_PATH" ]; then
    "$CUSTOM_SCRIPT_PATH"
fi

# Clone repository
if [ ! -d "$REPOSITORY_PATH" ]; then
    git clone "$REPOSITORY_URL" "$REPOSITORY_PATH"
fi

cd "$REPOSITORY_PATH"

# Start webhook
/usr/local/bin/webhook -verbose "$(find "$HOOKS_DIR" -type f -exec printf -- '-hooks=%s ' {} \;)" -hotreload -template

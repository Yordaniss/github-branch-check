#!/usr/bin/env bash
set -e

TARGET_BRANCH="$1"
BASE_BRANCH="$2"
CREATE_ISSUE="$3"

echo "🔁 Comparing '$TARGET_BRANCH' against '$BASE_BRANCH'"
echo "📝 Create issue if changes found: $CREATE_ISSUE"

chmod +x "${GITHUB_ACTION_PATH}/check.sh"

"${GITHUB_ACTION_PATH}/check.sh" "$TARGET_BRANCH" "$BASE_BRANCH" "$CREATE_ISSUE"

#!/usr/bin/env bash
set -e

TARGET_BRANCH="$1"
BASE_BRANCH="${2:-main}"
CREATE_ISSUE="${3:-true}"

echo "🚀 Starting maintenance check..."
echo "🔁 Comparing '$TARGET_BRANCH' against '$BASE_BRANCH'"
echo "📝 Create issue if changes found: $CREATE_ISSUE"

"${GITHUB_ACTION_PATH}/check.sh" "$TARGET_BRANCH" "$BASE_BRANCH" "$CREATE_ISSUE"

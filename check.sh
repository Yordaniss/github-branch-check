#!/usr/bin/env bash
set -e

TARGET_BRANCH="$1"
BASE_BRANCH="$2"
CREATE_ISSUE="$3"

echo "🔍 Checking if '$TARGET_BRANCH' contains commits not in '$BASE_BRANCH'..."

git fetch origin "$TARGET_BRANCH" "$BASE_BRANCH"

COMMITS=$(git log origin/"$BASE_BRANCH"..origin/"$TARGET_BRANCH" --oneline)

if [[ -z "$COMMITS" ]]; then
    echo "✅ No new commits found in '$TARGET_BRANCH' that are missing from '$BASE_BRANCH'."
    exit 0
else
    echo "⚠️ Found commits in '$TARGET_BRANCH' that are not in '$BASE_BRANCH':"
    echo "$COMMITS"

    if [[ "$CREATE_ISSUE" == "true" ]]; then
        echo "📬 Creating GitHub Issue..."

        TITLE="🚨 Unmerged commits from $TARGET_BRANCH into $BASE_BRANCH"
        BODY="The branch \`$TARGET_BRANCH\` contains commits that are not yet in \`$BASE_BRANCH\`.

Commits:
\`\`\`
$COMMITS
\`\`\`

Please check if a merge is needed."

        gh issue create \
          --title "$TITLE" \
          --body "$BODY" \
          --label "maintenance-check" \
          --repo "$GITHUB_REPOSITORY"
    else
        echo "ℹ️ Skipping issue creation."
    fi
fi

# 🛠️ Maintenance Branch Checker

A GitHub Action that checks whether a maintenance branch contains commits that are not yet merged into a base branch like `main`. If differences are found, an optional GitHub Issue is created automatically.

---

## ✅ Features

- Compares a maintenance branch to a base branch
- Detects unmerged commits
- Optionally creates a GitHub Issue
- Runs manually or via schedule
- Supports user input via `workflow_dispatch`

---

## 🚀 Usage

### Important to give also write permissions to issues for automatic creating process 

```yaml
name: Test Maintenance Checker

on:
  workflow_dispatch:
    inputs:
      target_branch:
        description: 'Maintenance Branch to check'
        required: true
        default: 'maintenance-release-1'
      base_branch:
        description: 'Base branch to compare against'
        required: false
        default: 'main'
      create_issue:
        description: 'Create issue if changes found?'
        required: false
        default: 'true'

permissions:
  issues: write
  contents: read

jobs:
  check:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: Yordaniss/github-branch-check@v1.0.4
        with:
          target_branch: ${{ github.event.inputs.target_branch }}
          base_branch: ${{ github.event.inputs.base_branch }}
          create_issue: ${{ github.event.inputs.create_issue }}

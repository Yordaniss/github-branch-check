# Branch Checker

This GitHub Action checks whether a specific maintenance branch contains changes,
that have not yet been merged into focus branch - and optionally creates an issue.

## Example

```yaml
- uses: yordaniss/github-branch-check@v1
  with:
    target_branch: ${{ github.event.inputs.target_branch || 'maintenance-release-1' }}
    base_branch: ${{ github.event.inputs.base_branch || 'main' }}
    create_issue: ${{ github.event.inputs.create_issue || 'true' }}
```

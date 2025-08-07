# Branch Checker

Diese GitHub Action prüft, ob ein bestimmter Maintenance-Branch Änderungen enthält,
die noch nicht in `main` gemerged wurden – und erstellt optional ein Issue.

## Beispiel

```yaml
- uses: dein-user/maintenance-check-action@v1
  with:
    target_branch: ${{ github.event.inputs.target_branch || 'maintenance-release-3' }}
    base_branch: ${{ github.event.inputs.base_branch || 'main' }}
    create_issue: ${{ github.event.inputs.create_issue || 'true' }}
```

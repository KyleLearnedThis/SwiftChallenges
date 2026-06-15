---
description: Checkout main, pull latest, and create a new branch.
argument-hint: <branch-name>
---

# /checkout — Create a New Branch from Latest Main

Run the following commands in sequence, stopping on any failure:

```bash
git checkout main
git pull
git checkout -b $ARGUMENTS
```

If any command fails, report the error and stop. Do not proceed to the next step.

On success, confirm: `✓ Created and switched to branch '$ARGUMENTS'`

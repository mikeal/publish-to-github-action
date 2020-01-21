# `publish-to-github-action`

A GitHub Action to push any local file changes, including new files, back to master.

This action is useful to put *after* other actions that modify files in the local checkout
that you'd then like to persist back into the repository.

Usage:

```
- uses: mikeal/publish-to-github-action@master
  env:
    GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

## Usage Notes

- For large data files, or if you have a lot of data, this action handles [Git LFS](https://git-lfs.github.com/), so you just need to initialize/config it in your repo. This helps if you are running into GitHub's 1GB data limit.
- If you can get away with only ever writing new files, instead of updating them, you won’t regret it ;) this project has collection methods that require both and the ones that do updates have to be GC’d occasionally, and the GC is a painful git history rewrite.

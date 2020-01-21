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

If you can get away with only ever writing new files, instead of updating them, you won’t regret it ;) Every time you update a file you retain the history of the file. Over time this can become quite large and contain a lot of duplicate data, even when using Git LFS as described below. The only want to garbage collect this historical data is to use a [hefty Java program called BFG](https://rtyley.github.io/bfg-repo-cleaner/) to re-write the history.

## Large Files (Git LFS)

For large data files, or if you have a lot of data, this action comes with the dependencies required for [Git LFS](https://git-lfs.github.com/), so as long as you've initialized and configured LFS for the files you're adding they will be added and pushed via Git LFS. This is particularly helpful if you are running into GitHub's 1GB data limit.

One thing to note is that files in Git LFS are stored out of the repository and then pulled in by LFS specific tools. This means that the default `git checkout` in an action won't have the real file data, it will have file stubs that tell LFS how to download the files. If your action needs these files to be fully available you have two options.

1. Set the `lfs` option to true in your [checkout action](https://github.com/actions/checkout#usage). This will download **all** the LFS files, which is rarely ideal and is a great way to blow out your LFS transfer limit ;)
2. Prior to reading the files, run `git lfs install` and `git pull --include files-i-want/*` in your action. This will pull out only the selected files.

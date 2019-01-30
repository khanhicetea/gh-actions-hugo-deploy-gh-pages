# Hugo Github Action

GitHub Action for building and publishing Hugo-built site.

Inspired by [BryanSchuetz/jekyll-deploy-gh-pages](https://github.com/BryanSchuetz/jekyll-deploy-gh-pages)

## Secrets

- `GITHUB_TOKEN` - *Required* for pushing files to gh-pages branch.
- `GIT_EMAIL` : *Required* your Github verified email, [this will trigger gh-pages build](https://help.github.com/articles/generic-jekyll-build-failures/#unverified-email-address). I put it in secret because of hiding your real identity from public access.

## Environment Variables

Nothing

## Example

**main.workflow**

```hcl
workflow "Deploy to GitHub Pages" {
  on = "push"
  resolves = ["hugo-deploy-gh-pages"]
}

action "hugo-deploy-gh-pages" {
  uses = "khanhicetea/gh-actions-hugo-deploy-gh-pages@master"
  secrets = [
    "GITHUB_TOKEN",
    "GIT_EMAIL",
  ]
}
```

## Example site

- https://github.com/khanhicetea/.com

## LICENSE

Copyright (c) 2019

Licensed under the MIT License.

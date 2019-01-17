# Hugo Github Action

GitHub Action for building and publishing Hugo-built site.

Inspired by [BryanSchuetz/jekyll-deploy-gh-pages](https://github.com/BryanSchuetz/jekyll-deploy-gh-pages)

## Secrets

- `GITHUB_TOKEN` - *Required* for pushing files to gh-pages branch.

## Environment Variables

NOTHING

## Example

**main.workflow**

```hcl
workflow "Deploy to GitHub Pages" {
  on = "push"
  resolves = ["hugo-deploy-gh-pages"]
}

action "hugo-deploy-gh-pages" {
  uses = "khanhicetea/gh-actions-hugo-deploy-gh-pages@master"
  secrets = ["GITHUB_TOKEN"]
}
```

## Example site

- https://github.com/khanhicetea/.com

## LICENSE

Copyright (c) 2019

Licensed under the MIT License.
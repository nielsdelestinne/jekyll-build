# jekyll-build
A Jekyll build GitHub Action

> Inspired & based on the source code of `jerryjvl/jekyll-build-action`

# Usage
This action allows you to build your Jekyll website. The resulting (`_site`) artifact should be published using a separate action.

## Input

### `jekyll-version`
**Required** The jekyll-version to use (e.g. 4.2.0)
- Use `latest` or a fixed version
- Supports the published versions of the `jekyll/builder` docker image

### `verbose`
**Optional** Enables verbose output of jekyll's `build` command
- Enable with value `true`


## Example
This is what an example workflow could look like
```yaml

name: Build and Deploy

on:
  push:
    branches:
      - master

jobs:
  jekyll:
    name: Build and Deploy
    runs-on: ubuntu-latest

    steps:
      - name: Checkout
        uses: actions/checkout@v2

      - name: Build
        uses: nielsdelestinne/jekyll-build@v1.0.0
        with:
          jekyll-version: 4.2.0
          verbose: true

      - name: Save Artifact
        uses: actions/upload-artifact@v2
        with:
          name: my-website
          path: _site

      - name: Deploy using FTP
        uses: sebastianpopp/ftp-action@releases/v2
        with:
          host: ${{ secrets.FTP_SERVER }}
          user: ${{ secrets.FTP_USERNAME }}
          password: ${{ secrets.FTP_PASSWORD }}
          localDir: "_site"
          remoteDir: "/public_html"
```

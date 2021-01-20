# Lintly-CFN-Nag GitHub Action

A GitHub Action that lints CloudFormation with cfn-nag then automatically creates pull request reviews if there are any violations.

 Originally based on https://github.com/grantmcconnaughey/lintly-flake8-github-action, which itself is based on [Lintly](http://github.com/grantmcconnaughey/Lintly) under the hood.

## Usage

To use Lintly-CFN-Nag GitHub Action, add the following to a GitHub Actions workflow file such as `.github/workflows/main.yml`:

```yaml
on: [pull_request]

jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - uses: 23andme/security-cfn-nag-lintly-action@v1.0
        with:
          # (Required) The GitHub API token to create reviews with
          token: ${{ secrets.GITHUB_TOKEN }}

          # Fail if "new" violations detected or "any", default "new"
          failIf: new

          # (Required) Path to CloudFormation filies:
          templatePath: "/templates/main.yml"

          # (Optional) Path to a YML file with rules to ignore
          # excludeRules: "cfn_nag_exclude.yml" 

          # Additional arguments to pass to cfn_nag
          args: ""
```

Now each PR created will be linted with cfn-nag. If there are any violations then Lintly will comment on the PR using the `github-actions` bot user.

![Lintly example](example.png)

**Note:** Lintly-CFN-Nag only works with the `pull_request` event. If your job runs on the `push` event then make sure the Lintly-CFN-Nag step only runs on the pull request event by adding `if: github.event_name == 'pull_request'`:

```yaml
      - uses: 23andme/security-cfn-nag-lintly-action@v1.0
        if: github.event_name == 'pull_request'
```

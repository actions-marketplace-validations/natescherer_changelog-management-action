# Changelog Management GitHub Action
<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-1-orange.svg?style=flat-square)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->

A GitHub action to parse and update changelogs in Keep a Changelog 1.0.0 format; built on the ChangelogManagement PowerShell module.

Provides management tasks for changelogs, including updating for a release, reading data, and adding new changes.

It is tested and runs on `windows-latest`, `ubuntu-latest`, and `macos-latest`.

## Usage

### Release

```yaml
jobs:
  Job:
    runs-on: windows-latest
    steps:
      - name: Update Changelog for Release
        uses: natescherer/changelog-management-action@v1.0.0
        with:
          mode: release
          releaseVersion: 2.0.0
```

### Read Changelog Data

```yaml
jobs:
  Job:
    runs-on: windows-latest
    steps:
      - name: Read Changelog Data
        id: readchangelog
        uses: natescherer/changelog-management-action@v1.0.0
      - name: Echo Changelog Data
        run: |
          echo "${{ steps.readchangelog.outputs.lastVersion }}"
          echo "${{ steps.readchangelog.outputs.releaseNotes }}"
```

### Add New Change

```yaml
jobs:
  Job:
    runs-on: windows-latest
    steps:
      - name: Add Change
        uses: natescherer/changelog-management-action@v1.0.0
        with:
          mode: addchange
          changeType: added
          changeValue: Quantum entanglement
```

### Inputs

This Action defines the following formal inputs.

| Name | Req | Description
|-|-|-|
| **`path`** | false | Path to relative to the root of the project to a CHANGELOG.md file in Keep a Changelog 1.0.0 format. Defaults to CHANGELOG.md in the root of the project.
| **`mode`** | false | Mode for the action. Should be one of `readdata`, `release`, or `addchange`. Defaults to `readdata`.
| **`releaseVersion`** | false | Version number to use when updating a changelog for release. Only valid for mode `release`.
| **`changeType`** | false | Type of change to add. Should be one of `Added`, `Changed`, `Deprecated`, `Removed`, `Fixed`, or `Security`. Only valid for mode `addchange`.
| **`changeValue`** | false | Data for the change to add. Should be a single line string.  Only valid for mode `addchange`.

### Outputs

This Action defines the following formal outputs.

| Name | Description
|-|-|
| **`lastVersion`** | The version number of the latest release in the changelog.
| **`releaseNotes`** | Release notes composed of changes from the most recent release.

## Contributors

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tbody>
    <tr>
      <td align="center"><a href="https://www.linkedin.com/in/natescherer01/"><img src="https://avatars.githubusercontent.com/u/376408?v=4?s=100" width="100px;" alt="Nate Scherer"/><br /><sub><b>Nate Scherer</b></sub></a><br /><a href="https://github.com/natescherer/changelog-management-action/commits?author=natescherer" title="Code">💻</a> <a href="#infra-natescherer" title="Infrastructure (Hosting, Build-Tools, etc)">🚇</a> <a href="https://github.com/natescherer/changelog-management-action/commits?author=natescherer" title="Documentation">📖</a></td>
    </tr>
  </tbody>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://allcontributors.org) specification.
Contributions of any kind are welcome!

## License

This project is licensed under The MIT License - see [LICENSE](LICENSE) for details.

# Contributing

This guide explains how to contribute to the HuJSON VS Code extension.

## Prerequisites

Before you begin, install:

- [Node.js](https://nodejs.org/) v16 or later
- [VS Code](https://code.visualstudio.com/) v1.75 or later
- [@vscode/vsce](https://github.com/microsoft/vscode-vsce) for packaging

## Set up your development environment

1. Clone the repository:

   ```bash
   git clone https://github.com/tailscale/vscode-hujson.git
   cd vscode-hujson
   ```

1. Install development dependencies:

   ```bash
   npm install -g @vscode/vsce
   ```

1. Open the project in VS Code:

   ```bash
   code .
   ```

## Project structure

```text
vscode-hujson/
├── package.json                  # Extension manifest
├── language-configuration.json   # Language settings
├── hujson.tmLanguage.json        # TextMate grammar
├── snippets/
│   └── hujson.json               # Code snippets
├── images/
│   └── icon.png                  # Extension icon
├── test/
│   ├── sample.hujson             # Test file
│   ├── edge-cases.hujson         # Edge case tests
│   └── invalid.hujson            # Invalid syntax tests
├── docs/                         # Documentation
└── README.md
```

## Make changes

### Syntax highlighting grammar

The TextMate grammar in `hujson.tmLanguage.json` defines syntax highlighting. Key sections:

- `patterns`: Top-level patterns
- `repository`: Reusable pattern definitions
- `scopeName`: Must be `source.hujson`

After making grammar changes:

1. Press `F5` in VS Code to launch the Extension Development Host.

1. Open test files in `test/` to verify highlighting.

1. Check edge cases in `test/edge-cases.hujson`.

#### Grammar resources

- [TextMate Grammar Documentation](https://macromates.com/manual/en/language_grammars)
- [VS Code Syntax Highlighting Guide](https://code.visualstudio.com/api/language-extensions/syntax-highlight-guide)

### Language configuration

Edit `language-configuration.json` to change:

- Comment toggling
- Bracket definitions
- Paired character insertion
- Indentation rules
- On-enter rules

### Snippets

Add or modify snippets in `snippets/hujson.json`:

```json
{
  "Snippet Name": {
    "prefix": ["trigger", "alternate"],
    "body": [
      "line 1",
      "\tindented line with $1 placeholder",
      "$0"
    ],
    "description": "What this snippet does"
  }
}
```

Snippet variables:

- `$1`, `$2`: Tab stops
- `$0`: Final cursor position
- `${1:default}`: Placeholder with default value
- `${1|opt1,opt2|}`: Dropdown choice

### Package metadata

Edit `package.json` to update:

- Version number
- Description
- Keywords
- Categories
- Contribution points

## Test your changes

### Manual testing

1. Press `F5` in VS Code to launch the Extension Development Host.

1. Open files in the `test/` directory.

1. Verify:
   - Syntax highlighting for all token types
   - Comment toggling with keyboard shortcuts
   - Snippet expansion
   - Bracket matching and paired character insertion
   - Indentation behavior

### Test files

| File | Purpose |
|------|---------|
| `test/sample.hujson` | All standard features |
| `test/edge-cases.hujson` | Boundary conditions |
| `test/invalid.hujson` | Error highlighting |

### Check JSON file validity

Run these commands to verify all JSON files parse correctly:

```bash
node -e "JSON.parse(require('fs').readFileSync('package.json'))"
node -e "JSON.parse(require('fs').readFileSync('language-configuration.json'))"
node -e "JSON.parse(require('fs').readFileSync('hujson.tmLanguage.json'))"
node -e "JSON.parse(require('fs').readFileSync('snippets/hujson.json'))"
```

## Build the extension

### Create the extension package

A VSIX (Visual Studio Code Extension) file is a packaged extension that you can distribute and install.

```bash
vsce package
```

This creates `hujson-X.X.X.vsix`.

### Verify package contents

```bash
vsce ls
```

Confirm all required files appear in the output.

## Release a new version

A release script automates the release process. To release a new version:

```bash
npm run release <version>
# or
./scripts/release.sh <version>
```

For example, to release version 1.2.0:

```bash
npm run release 1.2.0
```

The script:

1. Validates the version format (semver).
1. Updates the version in `package.json`.
1. Adds a new entry to `docs/changelog.md` (you'll be prompted to fill in the details).
1. Commits the changes.
1. Creates a git tag.
1. Pushes the commit and tag to origin.

A GitHub Actions workflow then builds the VSIX package and creates a GitHub release with the package attached. The workflow verifies that the tag version matches `package.json` to prevent version mismatches.

## Submit your changes

### Before you submit

1. Test all changes manually.

1. Validate all JSON files.

1. Update documentation if needed.

1. Update CHANGELOG.md with your changes.

### Pull request guidelines

1. Create a descriptive branch name: `feature/add-xyz` or `fix/issue-123`.

1. Write a clear PR description that explains:
   - What the change does
   - Why you made the change
   - How to test the change

1. Reference any related issues.

## Code of conduct

Be respectful and constructive. Contributors of all experience levels are welcome.

## Get help

- Open an issue for bugs or feature requests.
- Check existing issues before creating new ones.
- Include reproduction steps for bugs.

## License

By contributing, you agree to license your contributions under the BSD 3-Clause license.

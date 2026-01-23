# Changelog

All notable changes to the HuJSON VS Code extension are documented here.

The format is based on [Keep a Changelog](https://keepachangelog.com/), and this project adheres to [Semantic Versioning](https://semver.org/).

## [1.1.2] - 2025-01-23

### Added

- **GitHub Actions release workflow**: Automated VSIX packaging and GitHub release creation on version tags
- **CONTRIBUTING.md**: Consolidated contributing guide in repository root with release instructions

### Changed

- Moved contributing guide from `docs/contributing.md` to `CONTRIBUTING.md`
- Updated getting started guide with link to GitHub releases page

## [1.1.0] - 2025-01-23

### Added

- **Snippets**: 10 new code snippets for common patterns
  - `obj` / `{}` - Empty object
  - `arr` / `[]` - Empty array
  - `kv` / `key` - String key-value pair
  - `kvn` / `keynum` - Number key-value pair
  - `kvb` / `keybool` - Boolean key-value pair
  - `kvo` / `keyobj` - Object key-value pair
  - `kva` / `keyarr` - Array key-value pair
  - `//` / `comment` - Line comment
  - `/*` / `blockcomment` - Block comment
  - `config` / `template` - Configuration file template

- **Grammar improvements**:
  - Unterminated string detection with `invalid.illegal` highlighting
  - Separate begin/end captures for block comments
  - Punctuation scope for line comment markers

- **Language configuration**:
  - Block comment continuation on Enter
  - Colorized bracket pairs support
  - `autoCloseBefore` for smarter auto-closing

- **Package metadata**:
  - Extension icon
  - Gallery banner for VS Code Marketplace
  - Homepage and bug tracker links
  - Remote development support (`extensionKind`)
  - "Formatters" category

- **Default editor settings** for HuJSON files:
  - 2-space indentation
  - Spaces instead of tabs
  - Advanced auto-indent

- **Test files** for grammar verification:
  - `test/sample.hujson` - Comprehensive feature test
  - `test/edge-cases.hujson` - Boundary condition tests
  - `test/invalid.hujson` - Error highlighting tests

- **Documentation**:
  - Getting started guide
  - Features documentation
  - Snippets reference
  - Configuration guide
  - Contributing guide
  - This changelog

### Changed

- Updated README with feature overview, snippet table, and documentation links
- Improved block comment grammar with proper begin/end captures
- Enhanced line comment grammar with punctuation scope

## [1.0.0] - Initial Release

### Added

- Syntax highlighting for HuJSON (`.hujson`) and JWCC (`.jwcc`) files
- Support for:
  - Line comments (`//`)
  - Block comments (`/* */`)
  - Trailing commas
  - All JSON value types (strings, numbers, booleans, null)
  - Escape sequences in strings
- Comment toggling with keyboard shortcuts
- Bracket matching and auto-closing
- Basic indentation rules
- Language aliases: HuJSON, JWCC, Human JSON, JSON with Commas and Comments

## Version history summary

| Version | Date | Highlights |
|---------|------|------------|
| 1.1.2 | 2025-01-23 | GitHub Actions release workflow, consolidated CONTRIBUTING.md |
| 1.1.0 | 2025-01-23 | Snippets, improved grammar, documentation |
| 1.0.0 | Initial | Basic syntax highlighting and language support |

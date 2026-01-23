# HuJSON for VS Code

[![Version](https://img.shields.io/badge/version-1.1.0-blue.svg)](https://github.com/tailscale/hujson)
[![License](https://img.shields.io/badge/license-BSD--3--Clause-green.svg)](LICENSE)
[![VS Code](https://img.shields.io/badge/VS%20Code-1.75%2B-blue.svg)](https://code.visualstudio.com/)

Syntax highlighting, snippets, and language support for [HuJSON](https://github.com/tailscale/hujson) (Human JSON), also known as [JWCC](https://nigeltao.github.io/blog/2021/json-with-commas-comments.html) (JSON With Commas and Comments).

## What is HuJSON?

> [!TIP]
> HuJSON is the format Tailscale uses for its configuration files like the [tailnet policy file](https://tailscale.com/kb/1395/tailnet-policy-file). It's designed to be easy for humans to read and write.

HuJSON is a minimal extension of JSON that adds two features to make it more suitable for human-editable configuration files:

- **Comments**: C-style line comments (`//`) and block comments (`/* */`)
- **Trailing commas**: Optional commas after the final element in arrays and objects

All valid JSON is also valid HuJSON.

```hujson
{
  // Configuration for my application
  "name": "my-app",
  "version": "1.0.0",

  /*
   * Database settings
   */
  "database": {
    "host": "localhost",
    "port": 5432,
  },

  "features": [
    "auth",
    "logging",
    "metrics",  // Trailing commas are allowed
  ],
}
```

## Features

- **Syntax highlighting** for `.hujson` and `.jwcc` files
- **10 built-in snippets** for common patterns
- **Comment toggling** with keyboard shortcuts
- **Bracket matching** and auto-closing pairs
- **Bracket colorization** support
- **Smart indentation** handling
- **Block comment continuation** when pressing Enter

## Installation

Download the latest `.vsix` file from the [releases page](https://github.com/tailscale/vscode-hujson/releases), then install it in VS Code:

1. Open the Command Palette (`Cmd+Shift+P` or `Ctrl+Shift+P`)
1. Run "Extensions: Install from VSIX..."
1. Select the downloaded file

Refer to the [getting started guide](docs/getting-started.md) for alternative installation methods.

## Snippets

Type these prefixes and press `Tab` to expand:

| Prefix | Description |
|--------|-------------|
| `obj` | Empty object with key-value placeholder |
| `arr` | Empty array |
| `kv` | Key-value pair (string) |
| `kvn` | Key-value pair (number) |
| `kvb` | Key-value pair (boolean) |
| `kvo` | Key-value pair (nested object) |
| `kva` | Key-value pair (array) |
| `//` | Line comment |
| `/*` | Block comment |
| `config` | Configuration file template |

Refer to the [Snippets Reference](docs/snippets.md) for details and examples.

## Keyboard shortcuts

| Action | macOS | Windows/Linux |
|--------|-------|---------------|
| Toggle line comment | `Cmd+/` | `Ctrl+/` |
| Toggle block comment | `Shift+Option+A` | `Shift+Alt+A` |

## File extensions

The extension automatically activates for:

- `.hujson`
- `.jwcc`

## Default editor settings

The extension configures sensible defaults for HuJSON files:

- 2-space indentation
- Spaces instead of tabs
- Advanced auto-indent

Refer to [Configuration](docs/configuration.md) to customize these settings.

## Documentation

- [Getting started](docs/getting-started.md) - Installation and setup
- [Features](docs/features.md) - Detailed feature documentation
- [Snippets reference](docs/snippets.md) - All available snippets
- [Configuration](docs/configuration.md) - Settings and customization
- [Contributing](CONTRIBUTING.md) - How to contribute
- [Changelog](docs/changelog.md) - Version history

## Related resources

- [HuJSON Go library](https://github.com/tailscale/hujson) - Reference implementation
- [JWCC specification](https://nigeltao.github.io/blog/2021/json-with-commas-comments.html) - Format specification
- [Tailscale](https://tailscale.com) - HuJSON creators

## License

BSD-3-Clause

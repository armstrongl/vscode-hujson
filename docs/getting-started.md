# Getting started

This guide covers installation and basic usage of the HuJSON VS Code extension.

## Requirements

- VS Code version 1.75.0 or later
- No additional dependencies required

## Installation

### From extension package file (recommended)

A VSIX file is a packaged VS Code extension. To install:

1. Download the latest `.vsix` file from the [releases page](https://github.com/tailscale/vscode-hujson/releases).

1. Open VS Code.

1. Open the Command Palette with `Cmd+Shift+P` (macOS) or `Ctrl+Shift+P` (Windows/Linux).

1. Type "Extensions: Install from VSIX" and select it.

1. Navigate to and select the downloaded `.vsix` file.

1. Reload VS Code when prompted.

### Manual installation

Copy the extension folder to your VS Code extensions directory:

| Platform | Path |
|----------|------|
| macOS | `~/.vscode/extensions/hujson-1.1.0` |
| Linux | `~/.vscode/extensions/hujson-1.1.0` |
| Windows | `%USERPROFILE%\.vscode\extensions\hujson-1.1.0` |

### From the VS Code Marketplace

If published to the marketplace:

1. Open VS Code.

1. Go to the Extensions view (`Cmd+Shift+X` or `Ctrl+Shift+X`).

1. Search for HuJSON.

1. Select **Install**.

## Verify installation

1. Create a new file with the `.hujson` or `.jwcc` extension.

1. Add some HuJSON content:

   ```hujson
   {
     // This is a comment
     "hello": "world",
   }
   ```

1. Confirm that:
   - Syntax highlighting appears
   - Comments display in a different color
   - The language indicator in the status bar shows HuJSON

## First steps

### Create a HuJSON file

1. Create a new file: `File > New File`

1. Save it with a `.hujson` or `.jwcc` extension.

1. The extension activates automatically.

### Use comments

HuJSON supports two comment styles:

```hujson
{
  // Single-line comment
  "key1": "value1",

  /*
   * Multi-line
   * block comment
   */
  "key2": "value2",
}
```

Toggle comments with:

- Line comment: `Cmd+/` (macOS) or `Ctrl+/` (Windows/Linux)
- Block comment: `Shift+Option+A` (macOS) or `Shift+Alt+A` (Windows/Linux)

### Use trailing commas

Unlike standard JSON, HuJSON supports trailing commas:

```hujson
{
  "items": [
    "first",
    "second",
    "third",  // <- This comma is valid
  ],  // <- This one too
}
```

Trailing commas remove the need to manage commas when reordering or adding items.

### Use snippets

Type a snippet prefix and press `Tab` to expand:

1. Type `config` in an empty file.

1. Press `Tab`.

1. A configuration template appears.

1. Use `Tab` to move between placeholders.

Refer to the [Snippets reference](snippets.md) for all available snippets.

## Next steps

- [Features](features.md) - All extension features
- [Snippets reference](snippets.md) - All available snippets
- [Configuration](configuration.md) - Customize the extension

## Troubleshooting

### Syntax highlighting not working

1. Check the language mode in the status bar (bottom-right).

1. Select it and choose HuJSON if not already selected.

1. Confirm the file has a `.hujson` or `.jwcc` extension.

### Extension not activating

1. Open the Output panel (`View > Output`).

1. Select "Extension Host" from the dropdown.

1. Check for any error messages related to HuJSON.

1. Try reloading VS Code: `Cmd+Shift+P` > "Developer: Reload Window"

### Comments not toggling

Confirm your cursor is in the editor and the file type is HuJSON (check the status bar).

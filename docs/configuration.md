# Configuration

This guide covers how to configure and customize the HuJSON VS Code extension.

## Default settings

The extension provides these default settings for HuJSON files:

```json
{
  "[hujson]": {
    "editor.insertSpaces": true,
    "editor.tabSize": 2,
    "editor.autoIndent": "advanced",
    "editor.formatOnSave": false
  }
}
```

## Overriding defaults

Add your preferences to VS Code settings (`Cmd+,` or `Ctrl+,`):

### User settings (global)

Edit `~/Library/Application Support/Code/User/settings.json` (macOS), `~/.config/Code/User/settings.json` (Linux), or `%APPDATA%\Code\User\settings.json` (Windows). You can also use the Settings UI:

```json
{
  "[hujson]": {
    "editor.tabSize": 4,
    "editor.wordWrap": "on"
  }
}
```

### Workspace settings (project-specific)

Create `.vscode/settings.json` in your project:

```json
{
  "[hujson]": {
    "editor.tabSize": 2,
    "editor.rulers": [80, 120]
  }
}
```

## File associations

### Adding custom extensions

Associate additional file extensions with HuJSON:

```json
{
  "files.associations": {
    "*.myconfig": "hujson",
    "*.cfg.json": "hujson",
    ".myapprc": "hujson"
  }
}
```

### Common configuration files

Some applications use HuJSON for configuration. Associate their files:

```json
{
  "files.associations": {
    "tailscale.conf": "hujson"
  }
}
```

## Editor behavior

### Indentation

Control indentation style:

```json
{
  "[hujson]": {
    "editor.tabSize": 2,
    "editor.insertSpaces": true,
    "editor.detectIndentation": false
  }
}
```

### Word wrap

Enable word wrap for long values:

```json
{
  "[hujson]": {
    "editor.wordWrap": "on",
    "editor.wordWrapColumn": 120
  }
}
```

### Minimap

Disable the minimap for config files:

```json
{
  "[hujson]": {
    "editor.minimap.enabled": false
  }
}
```

## Bracket settings

### Bracket pair colorization

Enable colorized bracket pairs:

```json
{
  "editor.bracketPairColorization.enabled": true,
  "editor.guides.bracketPairs": "active"
}
```

### Bracket matching

Highlight matching brackets:

```json
{
  "editor.matchBrackets": "always"
}
```

## Snippet settings

### Snippet suggestions

Control when snippets appear:

```json
{
  "[hujson]": {
    "editor.snippetSuggestions": "top"
  }
}
```

Options:

- `"top"` - Show snippets above other suggestions
- `"bottom"` - Show snippets below other suggestions
- `"inline"` - Show snippets mixed with other suggestions
- `"none"` - Hide snippet suggestions

### Tab completion

Enable tab completion for snippets:

```json
{
  "editor.tabCompletion": "on"
}
```

## Formatting

### Format on save

The extension does not include a formatter. To enable format on save with a custom formatter:

```json
{
  "[hujson]": {
    "editor.formatOnSave": true,
    "editor.defaultFormatter": "your-formatter-extension"
  }
}
```

### Format on paste

```json
{
  "[hujson]": {
    "editor.formatOnPaste": true
  }
}
```

## Validation

HuJSON files are not validated by default since they are not valid JSON. If you have a HuJSON-aware validator extension, configure it per your needs.

## Remote development

The extension works in remote development scenarios. No additional configuration is needed for:

- Remote - SSH
- Remote - Containers
- GitHub Codespaces
- WSL

## Recommended settings

Here is a recommended configuration for HuJSON editing:

```json
{
  "[hujson]": {
    "editor.tabSize": 2,
    "editor.insertSpaces": true,
    "editor.autoIndent": "advanced",
    "editor.wordWrap": "on",
    "editor.minimap.enabled": false,
    "editor.snippetSuggestions": "top",
    "editor.quickSuggestions": {
      "strings": true
    }
  },
  "editor.bracketPairColorization.enabled": true,
  "editor.guides.bracketPairs": "active"
}
```

## Troubleshooting configuration

### Settings not applied

1. Ensure you are editing a file recognized as HuJSON (check status bar).
1. Reload VS Code after changing settings.
1. Check for conflicting settings in workspace vs user settings.

### Finding effective settings

Use the Settings editor to see which settings apply:

1. Open Settings (`Cmd+,` or `Ctrl+,`).
1. Search for the setting name.
1. Check the "Modified" indicator and scope (User/Workspace/Default).

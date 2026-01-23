# Features

This document describes all features provided by the HuJSON VS Code extension.

## Syntax highlighting

The extension provides comprehensive syntax highlighting for all HuJSON elements.

### Supported token types

| Element | Description | Example |
|---------|-------------|---------|
| Strings | Double-quoted text | `"hello world"` |
| Numbers | Integers, floats, scientific notation | `42`, `3.14`, `1.5e10` |
| Booleans | True/false values | `true`, `false` |
| Null | Null value | `null` |
| Property names | Object keys | `"name":` |
| Line comments | Single-line comments | `// comment` |
| Block comments | Multi-line comments | `/* comment */` |
| Punctuation | Brackets, colons, commas | `{`, `}`, `[`, `]`, `:`, `,` |

### Escape sequences

All JSON escape sequences are highlighted within strings:

- `\"` - Double quote
- `\\` - Backslash
- `\/` - Forward slash
- `\b` - Backspace
- `\f` - Form feed
- `\n` - Newline
- `\r` - Carriage return
- `\t` - Tab
- `\uXXXX` - Unicode code point

### Invalid syntax detection

The grammar detects and highlights invalid constructs:

- Unterminated strings (strings missing closing quote)
- Invalid escape sequences

## Comments

HuJSON supports C-style comments that are stripped when parsing.

### Line comments

```hujson
{
  // This is a line comment
  "key": "value",  // Comments can follow values
}
```

### Block comments

```hujson
{
  /*
   * This is a block comment.
   * It can span multiple lines.
   */
  "key": "value",
}
```

### Comment continuation

When you press Enter inside a block comment, the extension automatically continues the comment:

```hujson
/*
 * Line one
 * |  <- Cursor here, press Enter
 * |  <- New line with "* " prefix added
 */
```

## Bracket features

### Bracket matching

Click next to a bracket to highlight its matching pair:

- `{` matches `}`
- `[` matches `]`

### Bracket colorization

With VS Code's bracket pair colorization enabled, nested brackets display in different colors.

Enable in settings:

```json
{
  "editor.bracketPairColorization.enabled": true
}
```

### Paired character insertion

When you type an opening bracket, the closing bracket is inserted automatically:

| Type | Get |
|------|-----|
| `{` | `{}` |
| `[` | `[]` |
| `"` | `""` |

## Indentation

### Smart indentation

The extension provides intelligent indentation:

- Increases indent after `{` or `[`
- Decreases indent after `}` or `]`
- Maintains indent level within structures

### Default indentation settings

For HuJSON files, the extension sets:

- Tab size: 2 spaces
- Insert spaces: true
- Auto-indent: advanced

Refer to [Configuration](configuration.md) to customize these.

## Snippets

The extension includes 10 built-in snippets for common patterns.

| Prefix | Produces |
|--------|----------|
| `obj` | Empty object |
| `arr` | Empty array |
| `kv` | String key-value |
| `kvn` | Number key-value |
| `kvb` | Boolean key-value |
| `kvo` | Object key-value |
| `kva` | Array key-value |
| `//` | Line comment |
| `/*` | Block comment |
| `config` | Config template |

Refer to [Snippets Reference](snippets.md) for detailed usage.

## File associations

### Default extensions

The extension activates automatically for:

- `.hujson`
- `.jwcc`

### Custom associations

To associate additional file extensions with HuJSON, add to your settings:

```json
{
  "files.associations": {
    "*.myconfig": "hujson",
    ".myrc": "hujson"
  }
}
```

## Remote development support

The extension is configured with `extensionKind: ["workspace"]`, ensuring it runs in the workspace context for remote development scenarios:

- Remote - SSH
- Remote - Containers
- GitHub Codespaces
- WSL

## Language aliases

The extension registers these language aliases:

- HuJSON
- JWCC
- Human JSON
- JSON with Commas and Comments

Use any of these when selecting the language mode manually.

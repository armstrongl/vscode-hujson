# Snippets Reference

The HuJSON extension includes 10 built-in snippets for common editing patterns. Type a prefix and press `Tab` to expand.

## Use snippets

1. Type the snippet prefix (e.g., `obj`).
2. Press `Tab` to expand the snippet.
3. Fill in the placeholder values.
4. Press `Tab` to move to the next placeholder.
5. Press `Escape` or move the cursor to exit snippet mode.

## Available snippets

### Empty object

**Prefix:** `obj` or `{}`

Creates an empty object with a key-value placeholder.

```hujson
{
  "key": "value"
}
```

**Placeholders:**
1. Property name (default: empty)
2. Property value (default: empty)

---

### Empty array

**Prefix:** `arr` or `[]`

Creates an empty array.

```hujson
[

]
```

**Placeholders:**
1. Array content (cursor positioned inside)

---

### Key-value pair (string)

**Prefix:** `kv` or `key`

Creates a key-value pair with a string value.

```hujson
"key": "value"
```

**Placeholders:**
1. Key name (default: "key")
2. String value (default: "value")

---

### Key-value pair (number)

**Prefix:** `kvn` or `keynum`

Creates a key-value pair with a number value.

```hujson
"key": 0
```

**Placeholders:**
1. Key name (default: "key")
2. Number value (default: 0)

---

### Key-value pair (boolean)

**Prefix:** `kvb` or `keybool`

Creates a key-value pair with a boolean value. Provides a dropdown choice between `true` and `false`.

```hujson
"key": true
```

**Placeholders:**
1. Key name (default: "key")
2. Boolean value (choice: true/false)

---

### Key-value pair (object)

**Prefix:** `kvo` or `keyobj`

Creates a key-value pair with a nested object.

```hujson
"key": {

}
```

**Placeholders:**
1. Key name (default: "key")
2. Object content (cursor positioned inside)

---

### Key-value pair (array)

**Prefix:** `kva` or `keyarr`

Creates a key-value pair with an array value.

```hujson
"key": [

]
```

**Placeholders:**
1. Key name (default: "key")
2. Array content (cursor positioned inside)

---

### Line comment

**Prefix:** `//` or `comment`

Creates a line comment.

```hujson
//
```

**Placeholders:**
1. Comment text (cursor positioned after `// `)

---

### Block comment

**Prefix:** `/*` or `blockcomment`

Creates a multi-line block comment.

```hujson
/*
 *
 */
```

**Placeholders:**
1. Comment text (cursor positioned after ` * `)

---

### Configuration template

**Prefix:** `config` or `template`

Creates a basic configuration file structure with common fields.

```hujson
{
  // Configuration file
  "name": "my-config",
  "version": "1.0.0",

}
```

**Placeholders:**
1. Comment description (default: "Configuration file")
2. Name value (default: "my-config")
3. Version value (default: "1.0.0")
4. Additional content (cursor positioned for more fields)

## Tips

### Chaining snippets

You can use snippets inside other snippets. For example:

1. Type `obj` and press `Tab` to create an object.
2. Inside the object, type `kv` and press `Tab` to add a key-value pair.

### Snippet alternatives

Most snippets have multiple prefixes for convenience:

| Primary | Alternative |
|---------|-------------|
| `obj` | `{}` |
| `arr` | `[]` |
| `kv` | `key` |
| `kvn` | `keynum` |
| `kvb` | `keybool` |
| `kvo` | `keyobj` |
| `kva` | `keyarr` |
| `//` | `comment` |
| `/*` | `blockcomment` |
| `config` | `template` |

### Disabling snippets

To disable HuJSON snippets, add to your settings:

```json
{
  "[hujson]": {
    "editor.snippetSuggestions": "none"
  }
}
```

To show snippets only when explicitly requested:

```json
{
  "[hujson]": {
    "editor.snippetSuggestions": "inline"
  }
}
```

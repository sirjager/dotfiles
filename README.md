```markdown
# RenderMarkdown.nvim

## Headings

### Before
```markdown
# My Awesome Project
## Features
### Installation
```

### After
```markdown
🎉 My Awesome Project  
✨ Features  
⚙️ Installation  
```

---

## Code Blocks

### Before
```markdown
```python
def hello_world():
    print("Hello, World!")
```

### After
```markdown
╔═══════════════════╗
║ Python Code Block ║
╚═══════════════════╝
def hello_world():
    print("Hello, World!")
```

---

## Task Lists

### Before
```markdown
- [ ] Write README
- [x] Configure plugin
```

### After
```markdown
❏ Write README  
✔ Configure plugin  
```

---

## Thematic Breaks

### Before
```markdown
---
```

### After
```markdown
═════════════════════════════
```

---

## Tables

### Before

| Feature    | Status  |
|------------|---------|
| Headings   | ✅      |
| Code Blocks| ✅      |


### After
```markdown
╔═══════════╦═════════╗
║ Feature   ║ Status  ║
╠═══════════╬═════════╣
║ Headings  ║ ✅      ║
║ Code Blocks║ ✅     ║
╚═══════════╩═════════╝
```

---

## Links

### Before
```markdown
[GitHub](https://github.com)
```

### After
```markdown
🔗 GitHub (https://github.com)
```
```

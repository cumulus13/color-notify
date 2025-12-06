# Color Picker Guide

Complete guide for using the Color Picker dialog in Color Notify.

## 🎨 Opening Color Picker

### Method 1: System Tray
1. Right-click Color Notify tray icon
2. Click **"🎨 Color Picker"**

### Method 2: Command Line (future)
```bash
color-notify --picker
```

## 🎯 Interface Overview

```
┌─────────────────────────────┐
│      Color Picker           │
├─────────────────────────────┤
│                             │
│    ┌─────────────────┐      │
│    │  Color Preview  │      │  ← Shows selected color
│    └─────────────────┘      │
│                             │
│   Color name: #FF5733       │  ← Current hex code
│                             │
│  [Choose Color] [Set Color] │  ← Action buttons
│                             │
│       [#FF5733]             │  ← Hex input field
│                             │
└─────────────────────────────┘
```

## 🖱️ Using Color Picker

### Choose Color (Qt Dialog)

1. Click **"Choose Color"** button
2. Qt color dialog opens with:
   - Color wheel/palette
   - RGB sliders
   - HSV controls
   - Hex input
3. Select your color
4. Click OK
5. Color automatically:
   - Shows in preview box
   - Updates color name
   - Copies to clipboard

### Manual Hex Input

1. Click in hex input field
2. Type hex code:
   - `#FF5733` (6 digits)
   - `#F00` (3 digits)
   - Case insensitive
3. Press **Enter** or click **"Set Color"**
4. Color applied immediately

### Clipboard Detection

The color picker automatically monitors clipboard:
- Copy any hex code: `#FF5733`
- Color picker auto-updates
- Works even if picker is minimized
- Checks every 1 second

## ⌨️ Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| `Q` | Close color picker |
| `Escape` | Close color picker |
| `A` | Enable Always on Top |
| `Shift + A` | Disable Always on Top |
| `Enter` | Apply color from hex input |

## 📋 Auto-Copy Feature

Every color selection automatically copies to clipboard:
- Choose from Qt dialog → Copied
- Set from hex input → Copied
- Detect from clipboard → Updated

Use immediately in:
- Design tools (Figma, Sketch, etc.)
- Code editors
- CSS files
- Any application accepting text

## 🎯 Workflow Examples

### Quick Color Picking
```
1. Open Color Picker (tray menu)
2. Click "Choose Color"
3. Pick color
4. Paste in your app (Ctrl+V)
```

### Testing Hex Codes
```
1. Open Color Picker
2. Type hex: #3498db
3. Press Enter
4. See preview
5. Copy to use
```

### Building Palette
```
1. Pick first color
2. Note hex code
3. Pick second color
4. Compare in preview
5. Continue for all colors
```

### From Screenshot
```
1. Screenshot color
2. Use eyedropper tool
3. Copy hex to clipboard
4. Color Picker auto-detects
5. Ready to use
```

## 🎨 Color Picker vs Notifications

| Feature | Color Picker | Notifications |
|---------|--------------|---------------|
| **Trigger** | Manual | Automatic |
| **Action** | Active selection | Passive monitoring |
| **Use Case** | Need to pick color | Verify copied color |
| **Interaction** | Full dialog | Quick popup |
| **Duration** | Stays open | Auto-hide |

Both work together! Use:
- **Color Picker** when you need to choose colors
- **Notifications** to verify colors you've copied

## 💡 Tips & Tricks

### Tip 1: Always on Top
Press `A` to keep picker above all windows while designing.

### Tip 2: Quick Input
You can omit the `#` symbol, picker adds it automatically.

### Tip 3: Rapid Testing
Keep picker open and paste different hex codes to compare.

### Tip 4: Keyboard Navigation
Use Tab to move between input and buttons.

### Tip 5: Multi-Monitor
Picker remembers which monitor you're on.

## 🔧 Advanced Usage

### Color Validation

Picker validates hex codes:
- ✅ `#FF5733` - Valid
- ✅ `#F00` - Valid (expands to #FF0000)
- ✅ `FF5733` - Valid (adds #)
- ❌ `#GG5733` - Invalid (shows error)
- ❌ `#12345` - Invalid (wrong length)

### Window Positioning

**Auto-Center:**
- Opens centered on current screen
- Re-centers after toggling AOT
- Remembers screen on multi-monitor

**Manual Move:**
- Drag window to preferred position
- Stays on chosen monitor
- Re-centers with AOT toggle

### Integration

**With Notifications:**
```
1. Use Picker to choose color
2. Color copied to clipboard
3. Notification shows confirmation
4. Both display same color
```

**With Design Tools:**
```
1. Pick color in Picker
2. Switch to design tool
3. Paste (Ctrl+V)
4. Color applied instantly
```

## 🐛 Troubleshooting

### Picker Won't Open
- Check tray menu accessible
- Try clicking tray icon multiple times
- Restart Color Notify

### Color Not Copying
- Check clipboard access
- Try manual copy (Ctrl+C on hex)
- Verify not blocked by other app

### Invalid Hex Error
- Check hex format (#RRGGBB or #RGB)
- Use only 0-9, A-F characters
- Include # symbol

### Window Too Small/Large
- Window size is fixed (300×300)
- Use system DPI scaling if needed

### Always on Top Not Working
- Some window managers override
- Try toggling with `A` key
- Check system window rules

## 📱 Future Enhancements

Planned features:
- [ ] HSL/HSV input support
- [ ] Color palette save/load
- [ ] Color history
- [ ] Gradient picker
- [ ] Color harmonies
- [ ] Accessibility contrast checker
- [ ] Export to multiple formats
- [ ] Custom color names
- [ ] Favorites/bookmarks
- [ ] Color mixer

## 🔗 Related

- Main README: [README.md](README.md)
- Quick Start: [QUICKSTART.md](QUICKSTART.md)
- Troubleshooting: [TROUBLESHOOTING.md](TROUBLESHOOTING.md)

---

**Happy Color Picking!** 🎨✨
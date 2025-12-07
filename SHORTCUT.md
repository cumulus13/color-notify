# Keyboard Shortcuts Guide

Complete guide to all keyboard shortcuts in Color Notify.

## 🌍 Global Shortcuts

These shortcuts work **system-wide**, from any application:

| Shortcut | Action | Description | Requirement |
|----------|--------|-------------|-------------|
| `Ctrl+Alt+Shift+C` | Open Color Picker | Opens color picker dialog from anywhere ⭐ | pynput library |

### Requirements

**To enable global hotkey:**
```bash
pip install pynput
```

Without pynput, you can still use:
- System tray menu → "🎨 Color Picker"
- All other features work normally

### How Global Shortcuts Work

**Technical Implementation:**
- Uses `pynput` library for cross-platform keyboard monitoring
- Listens for specific key combination system-wide
- Emits Qt signal to show color picker
- Works independently of app focus

**Platforms:**
- ✅ **Windows**: Works out of the box
- ⚠️ **macOS**: Requires accessibility permissions
- ⚠️ **Linux**: May need permissions on some systems

### Setup on Different Platforms

#### Windows
```bash
pip install pynput
# That's it! Works immediately
```

#### macOS
```bash
pip install pynput
# Grant permissions:
# System Preferences → Security & Privacy → Accessibility
# Add Python/Terminal to the list
# Restart Color Notify
```

#### Linux
```bash
pip install pynput
# May need to run with appropriate permissions
# Depends on desktop environment
```

### Example Usage

```
Working in Photoshop:
1. Need a color? Press Ctrl+Alt+Shift+C
2. Pick color
3. Press Alt+Tab to return to Photoshop
4. Paste (Ctrl+V)

Working in VS Code:
1. Writing CSS? Press Ctrl+Alt+Shift+C
2. Choose color
3. Back to code (Alt+Tab)
4. Paste hex value

Working in Browser:
1. See nice color? Press Ctrl+Alt+Shift+C
2. Pick color
3. Color auto-copied
4. Use anywhere!
```

## 🎨 Color Picker Shortcuts

These shortcuts work when Color Picker dialog is focused:

| Shortcut | Action | Description |
|----------|--------|-------------|
| `Q` | Close | Exit color picker |
| `Escape` | Close | Exit color picker |
| `Enter` | Apply | Set color from hex input |
| `A` | Always on Top ON | Enable AOT mode |
| `Shift+A` | Always on Top OFF | Disable AOT mode |
| `Tab` | Navigate | Move between input/buttons |

### Color Picker Workflow Shortcuts

**Quick Pick:**
```
Ctrl+Alt+Shift+C → Click Choose → Select → Auto-copied
```

**Manual Input:**
```
Ctrl+Alt+Shift+C → Type #FF5733 → Enter → Auto-copied
```

**Toggle AOT:**
```
Open Picker → Press A (on top) → Press Shift+A (normal)
```

## 🖱️ Mouse Actions

### In Color Picker
- **Click "Choose Color"**: Opens Qt color dialog
- **Click "Set Color"**: Applies hex from input
- **Click Preview**: No action (display only)
- **Click Input**: Focus for typing

### In Notifications
- **Click Notification**: Dismisses/closes notification
- **Right-click Tray**: Opens system tray menu

## 🎯 Shortcut Combinations

### Power User Workflow

**Rapid Color Testing:**
```
1. Ctrl+Alt+Shift+C (open)
2. Type hex
3. Enter (set)
4. See preview
5. Q (close)
Repeat as needed!
```

**Always on Top Workflow:**
```
1. Ctrl+Alt+Shift+C (open)
2. A (enable AOT)
3. Keep visible while working
4. Pick colors as needed
5. Shift+A (disable when done)
6. Q (close)
```

**Quick Reference:**
```
1. Ctrl+Alt+Shift+C (open)
2. Choose/type color
3. Don't close (keep as reference)
4. Use color in other apps
5. Q when done
```

## ⚙️ System Tray Shortcuts

While most actions are mouse-based, you can navigate tray menu with keyboard:

1. Click tray icon
2. Use ↑↓ arrows to navigate
3. Press Enter to select

**Tip**: Faster to use global shortcut `Ctrl+Alt+Shift+C`!

## 🔄 Shortcut Conflicts

### Resolving Conflicts

If `Ctrl+Alt+Shift+C` conflicts with another app:

**Option 1: Close conflicting app**
- Most apps don't use this combination
- Check if conflict is temporary

**Option 2: Use tray menu**
- Right-click tray icon
- Click "Color Picker"

**Option 3: Request custom shortcut** (future)
- Feature request: custom global shortcut
- GitHub: [Submit Issue](https://github.com/cumulus13/color-notify/issues)

### Common Conflicts

Usually safe, but may conflict with:
- Screen capture tools
- Clipboard managers
- Other color pickers
- Custom automation tools

## 💡 Shortcut Tips

### Tip 1: Muscle Memory
Practice the global shortcut a few times:
```
Ctrl+Alt+Shift+C
Ctrl+Alt+Shift+C
Ctrl+Alt+Shift+C
```
After 10 times, it becomes automatic!

### Tip 2: One-Hand Operation
Hold left hand:
- Ctrl (pinky)
- Alt (ring finger)
- Shift (middle finger)
- C (index finger)

Or use right Ctrl+Alt if preferred.

### Tip 3: Quick Close
Always end with `Q`:
```
Ctrl+Alt+Shift+C → Pick → Q
Ctrl+Alt+Shift+C → Type → Enter → Q
```

### Tip 4: Keep Open
Don't close if you need to:
- Compare multiple colors
- Reference while designing
- Test different values

Press `A` for Always on Top!

### Tip 5: Tab Navigation
```
Ctrl+Alt+Shift+C → Tab to input → Type → Enter
```
Full keyboard workflow, no mouse needed!

## 🚀 Advanced Shortcuts

### Rapid Color Switching
```bash
# Pick multiple colors quickly:
Ctrl+Alt+Shift+C → Pick Color 1 → Q
Ctrl+Alt+Shift+C → Pick Color 2 → Q
Ctrl+Alt+Shift+C → Pick Color 3 → Q
```

### Design Reference Mode
```bash
# Keep picker as reference:
Ctrl+Alt+Shift+C → A (AOT) → Position corner
# Work in main app
# Glance at picker when needed
# Pick new colors without closing
# Shift+A → Q when done
```

### Testing Mode
```bash
# Test many hex values:
Ctrl+Alt+Shift+C → A (AOT)
# Type hex → Enter → Check
# Type hex → Enter → Check
# Type hex → Enter → Check
# Q when done
```

## 📱 Platform-Specific

### Windows
- All shortcuts work as documented
- Ctrl+Alt+Shift+C is reliable

### Linux
- May conflict with desktop environments
- Test if global shortcut works
- Use tray menu as fallback

### macOS
- Global shortcuts may require accessibility permissions
- System Preferences → Security & Privacy → Accessibility
- Grant permission to Color Notify

## 🐛 Troubleshooting Shortcuts

### Global Shortcut Not Working

**Check 1: Is Color Notify running?**
- Look for tray icon
- If not running, start it

**Check 2: Permission issues?** (macOS/Linux)
- Grant accessibility permissions
- Restart Color Notify

**Check 3: Conflict with other app?**
- Close other color tools
- Check clipboard managers
- Try tray menu as alternative

**Check 4: Restart Color Notify**
```bash
# Kill and restart
color-notify
```

### Shortcuts Not Responding

**In Color Picker:**
- Make sure window is focused
- Click in the window first
- Try clicking different areas

**Global Shortcut:**
- Should always work
- Check no modal dialogs are blocking
- Restart if needed

## 📊 Shortcut Cheat Sheet

```
╔══════════════════════════════════════╗
║     COLOR NOTIFY SHORTCUTS           ║
╠══════════════════════════════════════╣
║ GLOBAL (anywhere):                   ║
║   Ctrl+Alt+Shift+C → Open Picker ⭐   ║
║                                      ║
║ COLOR PICKER (when focused):         ║
║   Q / Escape       → Close           ║
║   Enter            → Apply Hex       ║
║   A                → AOT On          ║
║   Shift+A          → AOT Off         ║
║   Tab              → Navigate        ║
║                                      ║
║ MOUSE:                               ║
║   Click Notification → Dismiss       ║
║   Right-click Tray   → Menu          ║
╚══════════════════════════════════════╝
```

Print this or save as wallpaper! 🖼️

## 🔮 Future Shortcuts

Planned for future versions:
- [ ] Custom global shortcut configuration
- [ ] Shortcut to toggle monitoring
- [ ] Quick notification test shortcut
- [ ] Shortcut to open config file
- [ ] Color history navigation shortcuts

Submit requests: [GitHub Issues](https://github.com/cumulus13/color-notify/issues)

---

**Master the shortcuts, master the workflow!** ⌨️✨
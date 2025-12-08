# Focus Management Guide

Complete guide to focus behavior in Color Notify.

## 🎯 Problem Solved

**Before:**
```
1. Open Color Picker (Ctrl+Alt+Shift+C)
2. Click "Choose Color"
3. Qt Color Dialog opens
4. Press Escape to cancel
5. ❌ Focus lost - stuck somewhere
6. ❌ Have to click window to get focus back
```

**After:**
```
1. Open Color Picker (Ctrl+Alt+Shift+C)
2. Click "Choose Color"
3. Qt Color Dialog opens
4. Press Escape to cancel
5. ✅ Focus returns to previous window automatically!
6. ✅ Continue working immediately
```

## 🔄 Focus Flow

### Scenario 1: Cancel Color Selection (Escape) ⭐

```
Previous App Window (e.g., Photoshop)
         ↓
    Ctrl+Alt+Shift+C
         ↓
   Color Picker opens (stores previous window)
         ↓
   Click "Choose Color"
         ↓
   Qt Color Dialog opens
         ↓
   Press Escape (cancel)
         ↓
   Color Picker CLOSES
         ↓
   ✅ Focus → Previous App Window (Photoshop)
```

**Key Point:** When you press Escape in Color Dialog, both Color Dialog AND Color Picker close, returning you directly to your work!

### Scenario 2: Select Color (OK)

**With auto_hide_after_pick = False (default):**
```
Previous App Window
         ↓
   Color Picker opens
         ↓
   Choose color → OK
         ↓
   Color copied to clipboard
         ↓
   ✅ Focus → Color Picker (for multiple picks)
   (Color Picker stays open)
```

**With auto_hide_after_pick = True:**
```
Previous App Window
         ↓
   Color Picker opens
         ↓
   Choose color → OK
         ↓
   Color copied to clipboard
         ↓
   Color Picker closes
         ↓
   ✅ Focus → Previous App Window
```

## ⚙️ Configuration

### Option 1: Keep Color Picker Open (Default)

**Use Case:** Multiple color picks
```ini
[color_picker]
auto_hide_after_pick = False
```

**Behavior:**
- Color Picker stays open
- Pick multiple colors quickly
- Focus stays on Color Picker
- Close manually with Q or Escape

**Workflow:**
```
Ctrl+Alt+Shift+C → Pick color 1 → Pick color 2 → Pick color 3 → Q
```

### Option 2: Auto-Hide After Pick

**Use Case:** Quick single color picks
```ini
[color_picker]
auto_hide_after_pick = True
```

**Behavior:**
- Color Picker closes after picking
- Focus returns to previous window
- Fast in-and-out workflow
- Re-open with Ctrl+Alt+Shift+C for next pick

**Workflow:**
```
Work → Ctrl+Alt+Shift+C → Pick → Back to work
Work → Ctrl+Alt+Shift+C → Pick → Back to work
```

## 🎨 Focus Behavior Examples

### Example 1: Photoshop Workflow (Escape Behavior)

**Scenario:** Testing color but decide not to use it

**Flow:**
```
1. Working in Photoshop
2. Need color? Ctrl+Alt+Shift+C
3. Color Picker opens
4. Click "Choose Color"
5. Qt Color Dialog opens
6. Browse colors... "Hmm, not quite right"
7. Press Escape
8. ✅ Both dialogs close
9. ✅ Back in Photoshop immediately!
```

### Example 2: Quick Color Pick

**Setup:**
```ini
auto_hide_after_pick = True  # Quick picks
```

**Flow:**
```
1. Working in Photoshop
2. Need color? Ctrl+Alt+Shift+C
3. Choose color → OK
4. ✅ Back in Photoshop immediately
5. Paste color (Ctrl+V)
```

### Example 2: CSS Development

**Scenario:** Testing multiple colors

**Setup:**
```ini
auto_hide_after_pick = False  # Multiple picks
```

**Flow:**
```
1. VS Code open
2. Ctrl+Alt+Shift+C
3. Try color 1 → Pick
4. Try color 2 → Pick
5. Try color 3 → Pick
6. Done? Press Q
7. ✅ Back to VS Code
```

### Example 3: Color Palette Building

**Scenario:** Creating color scheme

**Setup:**
```ini
auto_hide_after_pick = False  # Keep open
```

**Flow:**
```
1. Open Color Picker
2. Pick base color
3. Pick accent 1
4. Pick accent 2
5. Pick accent 3
6. Close when done
7. All colors in clipboard history
```

## ⌨️ Keyboard Behavior

### In Color Picker

| Key | Action | Focus After |
|-----|--------|-------------|
| `Escape` | Close Color Picker | Previous window |
| `Q` | Close Color Picker | Previous window |
| `Enter` | Apply hex input | Color Picker |
| `Tab` | Navigate fields | Color Picker |

### In Qt Color Dialog

| Key | Action | Focus After | Config |
|-----|--------|-------------|--------|
| `Escape` | Cancel | Previous window | Always |
| `Enter` | OK/Select | Color Picker or Previous | auto_hide_after_pick |
| Click OK | Select | Color Picker or Previous | auto_hide_after_pick |

## 🔄 Focus Restoration Logic

### Smart Focus Detection

```python
# Before opening Color Dialog
previous_window = QApplication.activeWindow()

# After closing Color Dialog
if cancelled:
    → Restore to previous_window
elif auto_hide_after_pick:
    → Restore to previous_window
else:
    → Keep focus on Color Picker
```

### Timing

```python
# Small delay for smooth transition
QTimer.singleShot(100ms, restore_focus)

# Allows:
- Clean animation completion
- Proper Qt event processing
- Smooth user experience
```

## 💡 Use Case Recommendations

### Quick Color Picks
```ini
auto_hide_after_pick = True
```
**When:**
- Single color at a time
- Fast workflow
- Minimal interruption

**Benefits:**
- ✅ Fast in-and-out
- ✅ Back to work immediately
- ✅ Clean workspace

### Extended Color Sessions
```ini
auto_hide_after_pick = False
```
**When:**
- Multiple colors needed
- Building palettes
- Comparing colors

**Benefits:**
- ✅ Keep picker available
- ✅ Quick successive picks
- ✅ No re-opening needed

### Mixed Workflow
```ini
auto_hide_after_pick = False
```
**Then:**
- Use Q/Escape to close when done
- Best of both worlds
- Manual control

## 🐛 Troubleshooting

### Issue: Focus Not Returning

**Symptoms:**
- Press Escape in Color Dialog
- Focus doesn't return anywhere
- Have to click window

**Solutions:**

**1. Check Window Manager**
```bash
# Some window managers interfere
# Test with default window manager
```

**2. Increase Delay**
```python
# Edit code if needed
QTimer.singleShot(100, ...)  # Try 200 or 300
```

**3. Manual Focus**
```
# Press Alt+Tab to cycle windows
# Or click target window
```

### Issue: Wrong Window Gets Focus

**Symptoms:**
- Focus goes to unexpected window
- Not the previous window

**This happens when:**
- Multiple windows of same app open
- Window closed between opening picker and closing dialog
- OS focus management interferes

**Solutions:**
- Close unnecessary windows
- Keep target window visible
- Use auto_hide_after_pick = False

### Issue: Color Picker Won't Close

**Symptoms:**
- Escape doesn't close Color Picker after Color Dialog

**Solution:**
```
Try:
1. Q key instead
2. Click Color Picker window first
3. Then press Escape
```

## 🎯 Best Practices

### Practice 1: Consistent Config
```ini
# Choose one workflow and stick to it
auto_hide_after_pick = True   # OR
auto_hide_after_pick = False
```

### Practice 2: Keyboard Mastery
```
Learn the flow:
Ctrl+Alt+Shift+C → Choose → Escape → Continue
Ctrl+Alt+Shift+C → Choose → OK → Q → Continue
```

### Practice 3: Clean Desktop
```
- Keep target window visible
- Close unnecessary windows
- Reduces focus confusion
```

### Practice 4: Test Both Modes
```bash
# Try auto-hide first
[color_picker]
auto_hide_after_pick = True

# If doesn't fit, try keep-open
auto_hide_after_pick = False
```

## 📊 Behavior Comparison

| Scenario | auto_hide = False | auto_hide = True |
|----------|-------------------|------------------|
| **After OK** | Focus: Color Picker | Focus: Previous Window |
| **After Escape** | Focus: Previous Window | Focus: Previous Window |
| **Multiple Picks** | ✅ Excellent | ⚠️ Must re-open |
| **Single Pick** | ⚠️ Must close manually | ✅ Excellent |
| **Speed** | Medium (+ close time) | Fast |
| **Control** | More manual | More automatic |

## 🔮 Future Enhancements

Potential improvements:
- [ ] Remember last active window better
- [ ] Focus history tracking
- [ ] Per-application focus rules
- [ ] Configurable focus delay
- [ ] Focus indicator/highlight

## 🆘 Getting Help

If focus issues persist:

1. **Test with simple app**
   ```
   Open Notepad/TextEdit
   Try color picker
   Check if focus returns
   ```

2. **Check OS settings**
   - Window focus policy
   - Focus-follows-mouse settings
   - Window manager config

3. **Report issue**
   - GitHub: https://github.com/cumulus13/color-notify/issues
   - Include: OS, window manager, behavior description

---

**Focus management should now be seamless!** Press Escape and continue working! ⌨️✨
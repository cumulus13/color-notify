# Color Dialog Positioning Guide

The Qt Color Dialog can be positioned relative to the Color Picker dialog for optimal workflow.

## 🎯 Problem Solved

**Before:** Qt Color Dialog opened centered on screen, overlapping with Color Picker.
```
          Screen
┌─────────────────────────┐
│                         │
│      ┌────────┐         │
│      │ Color  │         │ ← Both centered, need to move one
│      │ Picker │         │
│      └────────┘         │
│      ┌────────┐         │
│      │   Qt   │         │
│      │ Color  │         │
│      │ Dialog │         │
│      └────────┘         │
│                         │
└─────────────────────────┘
```

**After:** Qt Color Dialog opens next to Color Picker automatically!
```
          Screen
┌─────────────────────────┐
│                         │
│  ┌────────┐ ┌────────┐ │
│  │ Color  │ │   Qt   │ │ ← Side by side!
│  │ Picker │ │ Color  │ │
│  └────────┘ │ Dialog │ │
│             └────────┘ │
│                         │
└─────────────────────────┘
```

## 📋 Configuration

Edit `~/.color-notify.ini` or `color-notify.ini`:

```ini
[color_picker]
# Position of Qt Color Dialog relative to Color Picker
# Options: left, right, top, bottom
color_dialog_position = right
```

## 🎨 Position Options

### 1. Right (Default) ⭐
```
┌────────┐ ┌────────┐
│ Color  │ │   Qt   │
│ Picker │ │ Dialog │
└────────┘ └────────┘
```

**Best for:**
- Right-handed users
- Standard workflows
- Most screen layouts

**Config:**
```ini
color_dialog_position = right
```

### 2. Left
```
┌────────┐ ┌────────┐
│   Qt   │ │ Color  │
│ Dialog │ │ Picker │
└────────┘ └────────┘
```

**Best for:**
- Left-handed users
- When Color Picker is on right edge
- Personal preference

**Config:**
```ini
color_dialog_position = left
```

### 3. Top
```
    ┌────────┐
    │   Qt   │
    │ Dialog │
    └────────┘
    ┌────────┐
    │ Color  │
    │ Picker │
    └────────┘
```

**Best for:**
- Vertical screen layouts
- Portrait monitors
- When horizontal space is limited

**Config:**
```ini
color_dialog_position = top
```

### 4. Bottom
```
    ┌────────┐
    │ Color  │
    │ Picker │
    └────────┘
    ┌────────┐
    │   Qt   │
    │ Dialog │
    └────────┘
```

**Best for:**
- Top taskbar layouts
- When Color Picker is at top
- Personal preference

**Config:**
```ini
color_dialog_position = bottom
```

## 🤖 Smart Positioning

The system automatically adjusts if the preferred position doesn't fit:

### Right Position with Fallback
```
Preferred: Right
Screen edge too close → Fallback: Left
Both don't fit → Center dialog
```

### Example Scenarios

**Scenario 1: Normal Screen**
```
Color Picker at center
→ Qt Dialog opens right ✅
```

**Scenario 2: Color Picker on Right Edge**
```
Color Picker on right edge
→ Not enough space on right
→ Qt Dialog opens left ✅
```

**Scenario 3: Small Screen**
```
Neither left nor right fits
→ Qt Dialog centers on screen
```

## 🖥️ Multi-Monitor Support

Works seamlessly across multiple monitors:

```
Monitor 1          Monitor 2
┌──────────┐      ┌──────────┐
│          │      │ ┌──┐ ┌──┐│
│          │      │ │CP│ │QD││
│          │      │ └──┘ └──┘│
└──────────┘      └──────────┘
```

The positioning respects screen boundaries on each monitor.

## ⚙️ Advanced Configuration

### Workflow-Based Settings

**Design Workflow:**
```ini
# Quick access from right
color_dialog_position = right
```

**Development Workflow:**
```ini
# Keep dialogs vertical to see code
color_dialog_position = top
```

**Small Screen:**
```ini
# Use vertical space
color_dialog_position = bottom
```

## 🎯 Usage Tips

### Tip 1: Match Your Workflow
Set position based on where you naturally look:
- Right-handed → `right`
- Left-handed → `left`

### Tip 2: Screen Layout
Consider your screen setup:
- Wide screen → `left` or `right`
- Portrait → `top` or `bottom`

### Tip 3: Multi-Monitor
On multi-monitor setups:
- Main work monitor → Position for easy access
- Secondary monitor → Any position works

### Tip 4: Test Different Positions
Try each position to find what feels natural:
```bash
# Test right
[color_picker]
color_dialog_position = right

# Test left
color_dialog_position = left

# Test top
color_dialog_position = top

# Test bottom
color_dialog_position = bottom
```

## 📊 Position Comparison

| Position | Pros | Cons | Best For |
|----------|------|------|----------|
| **Right** | Natural for most users | May go off-screen on right edge | General use ⭐ |
| **Left** | Good for left-handed | May go off-screen on left edge | Left-handed users |
| **Top** | Saves horizontal space | Uses vertical space | Portrait monitors |
| **Bottom** | Natural reading flow | Bottom taskbar conflict | Normal layouts |

## 🔧 Troubleshooting

### Issue: Dialog Still Opens in Center

**Check:**
1. Config file location correct?
2. Section `[color_picker]` exists?
3. Spelling correct? (`color_dialog_position`)
4. Reload config after change

**Solution:**
```bash
# 1. Edit config
vim ~/.color-notify.ini

# 2. Reload in Color Notify
Right-click tray → "Reload Config"

# 3. Test
Ctrl+Alt+Shift+C → Choose Color
```

### Issue: Dialog Goes Off-Screen

**This is expected behavior when:**
- Color Picker is near screen edge
- Screen is too small for both dialogs
- System will auto-fallback to alternative position

**Solution:**
- Move Color Picker more toward center
- Try different position option
- Use larger screen/resolution

### Issue: Position Not Changing

**Check:**
```ini
# Correct syntax
[color_picker]
color_dialog_position = right

# Not this
[color-picker]  ❌
colorDialogPosition = right  ❌
```

## 💡 Workflow Examples

### Example 1: Designer Workflow
```ini
# Color Picker always accessible
color_dialog_position = right

# Can quickly compare colors
# Picker on left, Qt Dialog on right
# Easy to switch between them
```

### Example 2: Developer Workflow
```ini
# Keep horizontal space for code
color_dialog_position = top

# Color Picker at bottom
# Qt Dialog above
# Code editor stays visible
```

### Example 3: Mobile/Small Screen
```ini
# Use vertical stacking
color_dialog_position = bottom

# Minimizes horizontal space usage
# Both dialogs vertically aligned
```

## 🎨 Visual Preferences

### Symmetrical Layout (Right)
```
  Screen Center
        ↓
    ┌───┴───┐
┌───┤       ├───┐
│CP │       │ QD│
└───┤       ├───┘
    └───────┘
    Balanced!
```

### Compact Layout (Top/Bottom)
```
Screen Width
├──────────────┤
    ┌───┐
    │QD │  ← Minimal width
    └───┘
    ┌───┐
    │CP │
    └───┘
```

## 📱 Platform Considerations

### Windows
- All positions work well
- Right is most natural

### macOS
- Consider menu bar at top
- Bottom position may be better

### Linux
- Depends on desktop environment
- Test what works best

## 🔮 Future Enhancements

Potential improvements:
- [ ] Custom offset distances
- [ ] Remember last position
- [ ] Auto-position based on screen size
- [ ] Snap-to-edge positioning
- [ ] Dual-monitor specific settings

---

**No more overlapping dialogs!** Set your preferred position and enjoy seamless color picking! 🎨✨
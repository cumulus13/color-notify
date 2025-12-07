# Global Hotkey Setup Guide

Complete guide to setting up and troubleshooting the global hotkey feature.

## 📋 Overview

Color Notify uses the `pynput` library to provide **true system-wide keyboard shortcuts** that work from any application.

**Global Hotkey:** `Ctrl+Alt+Shift+C` - Opens Color Picker

## 🔧 Installation

### Step 1: Install pynput

```bash
pip install pynput
```

Or if using the full package:
```bash
pip install color-notify
# pynput is automatically installed as a dependency
```

### Step 2: Verify Installation

```python
python -c "from pynput import keyboard; print('pynput installed successfully!')"
```

If successful, you should see: `pynput installed successfully!`

### Step 3: Restart Color Notify

```bash
color-notify
```

Check console output for:
```
Global hotkey registered: Ctrl+Alt+Shift+C
```

## 🖥️ Platform-Specific Setup

### Windows

**No additional setup required!**

1. Install pynput: `pip install pynput`
2. Run Color Notify: `color-notify`
3. Press `Ctrl+Alt+Shift+C` anywhere
4. Works immediately ✅

### macOS

**Requires Accessibility Permissions**

#### Grant Permissions:

1. Install pynput: `pip install pynput`
2. Run Color Notify once: `color-notify`
3. macOS will prompt for accessibility access
4. **OR manually grant permissions:**
   - Open **System Preferences**
   - Go to **Security & Privacy**
   - Click **Privacy** tab
   - Select **Accessibility** from left sidebar
   - Click the lock icon to make changes
   - Click **+** button
   - Add one of these:
     - **Terminal.app** (if running from Terminal)
     - **Python** (if running directly)
     - **Your IDE** (if running from IDE)
5. Restart Color Notify
6. Test: Press `Ctrl+Alt+Shift+C` ✅

#### Troubleshooting macOS:

**Hotkey still not working?**
- Remove and re-add the app in Accessibility list
- Try adding `/usr/bin/python3` instead
- Check Console.app for permission errors
- Reboot macOS if needed

### Linux

**May Require Permissions**

#### Ubuntu/Debian:

```bash
# Install pynput
pip install pynput

# Some systems need X11 development files
sudo apt-get install python3-xlib

# Run Color Notify
color-notify
```

#### Arch Linux:

```bash
# Install pynput
pip install pynput

# May need python-xlib
sudo pacman -S python-xlib

# Run
color-notify
```

#### Wayland Users:

Wayland has stricter security. Options:
1. Run under Xwayland
2. Use tray menu instead of global hotkey
3. Switch to X11 session temporarily

#### Troubleshooting Linux:

**Permission errors?**
```bash
# Check if user is in input group
groups

# If not, add user to input group
sudo usermod -a -G input $USER
# Log out and log back in
```

## ✅ Verification

### Test If Working:

1. Start Color Notify
2. Open any application (browser, editor, etc.)
3. Press `Ctrl+Alt+Shift+C`
4. Color Picker should appear ✅

### Check Status:

**Start Color Notify from terminal:**
```bash
color-notify
```

**Look for this message:**
```
Global hotkey registered: Ctrl+Alt+Shift+C
```

**If you see this instead:**
```
Warning: pynput not installed. Global hotkey disabled.
Install with: pip install pynput
```

Then pynput is not installed or not found.

## 🐛 Troubleshooting

### Issue 1: "pynput not installed"

**Solution:**
```bash
# Install pynput
pip install pynput

# Verify
pip list | grep pynput

# Should show: pynput 1.7.6 (or higher)
```

### Issue 2: "Global hotkey registration failed"

**Possible causes:**
- Another app is using the same shortcut
- Permissions not granted (macOS/Linux)
- Security software blocking

**Solutions:**
1. Check conflicting apps
2. Grant accessibility permissions
3. Try running as administrator (Windows)
4. Check security software settings

### Issue 3: Works in terminal but not elsewhere

**macOS:**
- Need to grant permissions to the **calling application**
- If running from Terminal, grant to Terminal
- If running from IDE, grant to IDE

**Linux:**
- Try running with `sudo` (not recommended for regular use)
- Check display manager logs
- Verify X11/Wayland compatibility

### Issue 4: Hotkey works but picker doesn't appear

**Check:**
```python
# Test manually
python3
>>> from pynput import keyboard
>>> # If this works, pynput is OK
```

**Color Notify specific:**
- Check console for Qt errors
- Try opening picker from tray menu
- If tray menu works, hotkey signal issue

### Issue 5: "ImportError: No module named 'pynput'"

**Solutions:**
```bash
# Check Python path
which python3
which pip3

# Install with specific Python
python3 -m pip install pynput

# Or use virtual environment
python3 -m venv venv
source venv/bin/activate  # Linux/Mac
venv\Scripts\activate     # Windows
pip install pynput color-notify
```

## 🔒 Security Considerations

### Why Permissions Are Needed

**pynput monitors keyboard input to detect shortcuts.**

- **Read-only access**: Only detects key combinations
- **No keystroke logging**: Only listens for specific hotkey
- **Privacy-safe**: Doesn't record or transmit anything
- **Open source**: Code is auditable

### Permission Scope

**macOS Accessibility:**
- Allows app to monitor keyboard
- Standard for global hotkey apps
- Similar to: Alfred, Rectangle, etc.

**Linux Input Group:**
- Standard permission for input devices
- Common for keyboard/mouse utilities
- Required for system-wide shortcuts

## 🚫 Fallback Options

### If Global Hotkey Doesn't Work:

**Option 1: Use Tray Menu**
- Right-click tray icon
- Click "🎨 Color Picker"
- Still fast and convenient

**Option 2: Disable Hotkey**
Future versions may allow disabling:
```ini
[hotkey]
enabled = False
```

**Option 3: Alternative Shortcut Tool**
Use system-level shortcut managers:
- **Windows**: AutoHotkey
- **macOS**: Karabiner-Elements
- **Linux**: xbindkeys

Map them to open Color Notify.

## 📊 Compatibility Matrix

| Platform | Status | Requirements |
|----------|--------|--------------|
| **Windows 10/11** | ✅ Full support | pynput only |
| **macOS 10.14+** | ✅ Full support | pynput + permissions |
| **Ubuntu 20.04+** | ✅ Full support | pynput + xlib |
| **Debian 10+** | ✅ Full support | pynput + xlib |
| **Arch Linux** | ✅ Full support | pynput + xlib |
| **Fedora** | ✅ Full support | pynput + xlib |
| **Wayland** | ⚠️ Limited | Use Xwayland or X11 |
| **WSL** | ❌ Not supported | Use native Windows |

## 🔄 Alternative Solutions

### If pynput Conflicts:

**Option 1: Different Library**
Request support for:
- `keyboard` library (requires root)
- `pyqt5-global-hotkey` (less maintained)

**Option 2: Custom Shortcut**
Future feature - configure your own:
```ini
[hotkey]
shortcut = Ctrl+Shift+P
```

**Option 3: No Global Hotkey**
All features work without it:
- Clipboard monitoring: ✅
- Tray menu access: ✅
- Notifications: ✅
- Only missing: System-wide shortcut

## 📝 Developer Notes

### How It Works:

```python
from pynput import keyboard

# Define hotkey combination
hotkey = keyboard.HotKey(
    keyboard.HotKey.parse('<ctrl>+<alt>+<shift>+c'),
    on_activate_callback
)

# Start listener
listener = keyboard.Listener(
    on_press=hotkey.press,
    on_release=hotkey.release
)
listener.start()
```

### Testing:

```bash
# Test pynput directly
python3 -c "
from pynput import keyboard
def on_press(key):
    print(f'Key pressed: {key}')
with keyboard.Listener(on_press=on_press) as listener:
    listener.join()
"
# Press Ctrl+C to stop
```

## 🆘 Getting Help

### Still Having Issues?

1. **Check Console Output**
   ```bash
   color-notify
   # Look for error messages
   ```

2. **Test pynput Separately**
   ```bash
   python3 -c "from pynput import keyboard; print('OK')"
   ```

3. **Check Permissions**
   - macOS: System Preferences → Security → Accessibility
   - Linux: `groups` command

4. **Report Issue**
   - GitHub: https://github.com/cumulus13/color-notify/issues
   - Include: OS, Python version, error messages

### Useful Commands:

```bash
# Check Python version
python3 --version

# Check pip version
pip3 --version

# List installed packages
pip list

# Check pynput
pip show pynput

# Reinstall pynput
pip uninstall pynput
pip install pynput
```

---

**Global hotkey should now work!** Press `Ctrl+Alt+Shift+C` anywhere! 🎨✨
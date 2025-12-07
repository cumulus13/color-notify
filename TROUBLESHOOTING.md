# Troubleshooting Guide

## Common Issues and Solutions

### 0. Global Hotkey Not Working

**Symptom:**
Pressing `Ctrl+Alt+Shift+C` doesn't open Color Picker

**Causes:**
- pynput not installed
- Permission issues (macOS/Linux)
- Conflicting application using same shortcut

**Solutions:**

#### A. Install pynput
```bash
pip install pynput
```

Check if installed:
```bash
pip list | grep pynput
```

#### B. Grant Permissions (macOS)
1. System Preferences → Security & Privacy
2. Privacy tab → Accessibility
3. Add Python or Terminal to the list
4. Restart Color Notify

#### C. Grant Permissions (Linux)
Some systems need permissions:
```bash
# Check if running
ps aux | grep color-notify

# Run with appropriate permissions if needed
```

#### D. Check for Conflicts
- Close other color picker apps
- Check keyboard remapping tools
- Try using tray menu as alternative

#### E. Verify Installation
```python
# Test pynput
python -c "from pynput import keyboard; print('pynput OK')"
```

If you see "Warning: pynput not installed" when starting:
```bash
pip install pynput
# Then restart color-notify
```

### 1. Clipboard Access Warnings (Windows)

**Symptom:**
```
qt.qpa.mime: Retrying to obtain clipboard.
qt.qpa.mime: Retrying to obtain clipboard.
```

**Cause:**
- Another application is using the clipboard
- Polling interval too fast (causing conflicts)
- Windows clipboard manager interference

**Solutions:**

#### A. Increase Polling Interval
Edit `~/.color-notify.ini` or `color-notify.ini`:

```ini
[detection]
poll_interval = 1000  # Try 1000-2000ms (1-2 seconds)
```

Recommended values:
- **500ms** - Very responsive, may cause conflicts
- **1000ms** - Good balance (default)
- **2000ms** - Very stable, slightly less responsive

#### B. Close Conflicting Apps
Common clipboard conflict apps:
- Clipboard managers (Ditto, ClipX, etc.)
- Screen capture tools (ShareX, Greenshot)
- Remote desktop applications
- Cloud sync clipboard features

Try closing these temporarily.

#### C. Use Signal-Based Detection Only
The app uses both signal-based and polling. On Windows, polling can cause issues. Future versions may allow disabling polling.

### 2. Notification Not Appearing

**Check 1: Is Monitoring Active?**
- Right-click tray icon
- Ensure it shows "⏸️ Pause Monitoring" (not "▶️ Resume")

**Check 2: Valid Color Format?**
Test with these known-good formats:
```
#FF0000
#F00
rgb(255, 0, 0)
```

**Check 3: Clipboard Access?**
- Check for warning messages in console
- Increase `poll_interval` to 2000

**Check 4: Test Notification**
- Right-click tray icon → "Test Notification"
- If this works, clipboard detection is the issue

### 3. Notification Position Wrong

**Multi-Monitor Setup:**
```ini
[notification]
margin = 50  # Increase margin if monitors have bezels
```

**Screen Resolution Changed:**
```ini
position = right_center  # Re-verify position
margin = 20              # Adjust margin
```

**Test Different Positions:**
Try: `center_center` first to verify notification is working.

### 4. Notification Too Transparent/Opaque

```ini
[notification]
opacity = 0.95  # Range: 0.0 (invisible) to 1.0 (opaque)
```

Common values:
- **0.7** - Very transparent
- **0.85** - Moderately transparent
- **0.95** - Slightly transparent (default)
- **1.0** - Completely opaque

### 5. Notification Disappears Too Fast/Slow

```ini
[notification]
timeout = 3000  # Milliseconds
```

Values:
- **0** - Never auto-hide (click to close)
- **1000** - 1 second
- **3000** - 3 seconds (default)
- **5000** - 5 seconds
- **10000** - 10 seconds

### 6. Tray Icon Not Visible

**Windows:**
- Check system tray overflow (click ^ arrow)
- Right-click taskbar → Taskbar settings → Select which icons appear

**Linux:**
- Ensure system tray extension is enabled
- KDE: May need plasma-nm-applet
- GNOME: May need gnome-shell-extension-appindicator

**macOS:**
- Check menu bar (top right)
- May be hidden if menu bar is full

### 7. High CPU Usage

**Reduce Polling Frequency:**
```ini
[detection]
poll_interval = 2000  # 2 seconds
```

**Check for Clipboard Loops:**
- Disable other clipboard monitors
- Check for clipboard sync apps

### 8. Python/PyQt5 Import Errors

**Windows:**
```bash
pip install --upgrade PyQt5
```

**Linux:**
```bash
sudo apt-get install python3-pyqt5
# or
pip install PyQt5
```

**macOS:**
```bash
brew install pyqt5
# or
pip install PyQt5
```

### 9. Config File Not Found

**Check Locations:**
1. `~/.color-notify.ini` (primary)
2. `color-notify.ini` (fallback)

**Create Manually:**
```bash
# Linux/macOS
touch ~/.color-notify.ini

# Windows (PowerShell)
New-Item -Path $env:USERPROFILE\.color-notify.ini -ItemType File

# Windows (CMD)
type nul > %USERPROFILE%\.color-notify.ini
```

Then edit with your preferred text editor.

### 10. Permission Errors

**Linux:**
```bash
chmod +x color_notify.py
```

**Install with --user:**
```bash
pip install --user color-notify
```

### 11. Notification Behind Other Windows

**Enable Always on Top:**
```ini
[notification]
always_on_top = True
```

Some window managers may override this setting.

### 12. App Doesn't Start

**Check Python Version:**
```bash
python --version  # Need 3.6+
```

**Check PyQt5 Installation:**
```bash
python -c "from PyQt5 import QtWidgets"
```

**Run with Debug:**
```bash
python -m color_notify
# Check console for errors
```

### 13. App Crashes on Startup

**Check Dependencies:**
```bash
pip install --upgrade PyQt5
```

**Try Clean Install:**
```bash
pip uninstall color-notify
pip install --no-cache-dir color-notify
```

**Check Config File Syntax:**
```bash
# Backup and remove config
mv ~/.color-notify.ini ~/.color-notify.ini.backup
# Run app - will create default config
color-notify
```

## Platform-Specific Issues

### Windows

**Issue: Clipboard warning spam**
- Solution: Increase `poll_interval` to 1000-2000ms
- Close clipboard manager apps

**Issue: Tray icon missing**
- Solution: Check system tray overflow area (^ icon)

### Linux

**Issue: No system tray**
- Solution: Install tray extension for your DE
- GNOME: `gnome-shell-extension-appindicator`
- KDE: Usually built-in

**Issue: Notification doesn't show**
- Solution: Check notification daemon is running
- `ps aux | grep notification`

### macOS

**Issue: Permission denied for clipboard**
- Solution: Grant accessibility permissions
- System Preferences → Security & Privacy → Accessibility

## Getting Help

If none of these solutions work:

1. **Check GitHub Issues:**
   https://github.com/cumulus13/color-notify/issues

2. **Create New Issue with:**
   - Your OS and version
   - Python version (`python --version`)
   - PyQt5 version (`pip show PyQt5`)
   - Config file contents
   - Full error message/console output
   - Steps to reproduce

3. **Email:**
   cumulus13@gmail.com

## Logs and Debugging

**Enable Verbose Output:**
```bash
# Run in console to see all messages
python -m color_notify
```

**Check Config Loading:**
```python
import configparser
config = configparser.ConfigParser()
config.read('~/.color-notify.ini')
print(config.sections())
```

## Best Practices

1. **Start with defaults** - Don't change too many settings at once
2. **Test after each change** - Use "Test Notification" feature
3. **Increase poll_interval** if you see clipboard warnings
4. **Use center_center position** for initial testing
5. **Check console output** for error messages

## Performance Tuning

For best performance:

```ini
[notification]
timeout = 3000
opacity = 0.95
always_on_top = True

[detection]
poll_interval = 1000  # Balance of responsiveness and stability
```

## Still Having Issues?

Contact: cumulus13@gmail.com
GitHub: https://github.com/cumulus13/color-notify/issues
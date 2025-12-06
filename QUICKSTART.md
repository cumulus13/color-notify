# Quick Start Guide

Get started with Color Notify in 2 minutes! 🚀

## Installation

```bash
pip install color-notify
```

## Run

```bash
color-notify
```

The app will start in the system tray. Look for the 🎨 icon.

## Two Ways to Use

### 1. Passive Mode - Clipboard Monitoring

Copy any of these color codes:

```
#FF5733
#00FF00
rgb(255, 100, 50)
```

A notification will appear showing the color! 🎨

### 2. Active Mode - Color Picker

1. Right-click tray icon → **"🎨 Color Picker"**
2. Choose a color:
   - Click "Choose Color" button
   - Or type hex code and press Enter
3. Color automatically copied to clipboard! ✨

#### Color Picker Shortcuts
- `Q` or `Escape` → Close
- `A` → Always on top ON
- `Shift+A` → Always on top OFF
- `Enter` → Set color from input

## First Time Setup

### 1. Configure Position

Right-click tray icon → **Open Config File**

```ini
[notification]
position = right_center
```

Options:
- `left_up`, `left_center`, `left_down`
- `center_up`, `center_center`, `center_down`
- `right_up`, `right_center`, `right_down`

### 2. Set Timeout

```ini
timeout = 3000  # 3 seconds
# or
timeout = 0     # No auto-hide (click to close)
```

### 3. Adjust Transparency

```ini
opacity = 0.95  # 95% opaque (0.0 - 1.0)
```

### 4. Reload Config

Right-click tray icon → **Reload Config**

No need to restart! ✨

## Daily Usage

### Copying Colors

From anywhere (browser, design tool, code editor):
1. Copy color code to clipboard
2. Notification appears automatically
3. Click notification to dismiss (or wait for timeout)

### Pause Monitoring

Right-click tray icon → **Pause Monitoring**

Great when you don't want notifications for a while.

### Test Notification

Right-click tray icon → **Test Notification**

Shows a random color to verify settings.

## Common Use Cases

### For Designers
- Quick color reference from design files
- Verify colors from screenshots
- Check accessibility (luminance display)

### For Developers
- Monitor colors from code
- Verify hex/rgb conversions
- Quick color validation

### For QA/Testing
- Verify UI colors match specs
- Document color usage
- Cross-reference design systems

## Tips & Tricks

### Quick Access
- Keep config file open in editor
- Reload config frequently while adjusting
- Use Test Notification to preview

### Multiple Monitors
- Adjust `margin` for different monitor sizes
- Position on secondary monitor edges

### No Auto-Hide
```ini
timeout = 0
```
Perfect for:
- Taking screenshots
- Comparing colors
- Long reference time

### Subtle Notifications
```ini
opacity = 0.7
timeout = 2000
position = right_down
margin = 10
```

### Bold Notifications
```ini
opacity = 1.0
timeout = 5000
position = center_center
always_on_top = True
```

## Keyboard Shortcuts

While notification is visible:
- **Click** → Close notification

System tray (OS-dependent):
- **Right-click** → Open menu

## Color Formats Supported

### HEX
- `#FF0000` (6 digits)
- `#F00` (3 digits)
- Case insensitive

### RGB
- `rgb(255, 0, 0)`
- Spaces optional
- Case insensitive
- Values: 0-255

## Troubleshooting

### Notification Not Appearing?

1. Check tray icon is visible
2. Verify monitoring not paused
3. Copy a valid color format
4. Try Test Notification

### Can't Find Config?

Config checked in order:
1. `~/.color-notify.ini` (home directory)
2. `color-notify.ini` (current directory)

Create manually if missing:
```bash
# Linux/Mac
touch ~/.color-notify.ini

# Windows
notepad %USERPROFILE%\.color-notify.ini
```

### Notification Position Wrong?

Check screen resolution changed:
1. Open config
2. Adjust `margin` value
3. Reload config
4. Test notification

### Always on Top Not Working?

```ini
[notification]
always_on_top = True
```

Some window managers may override this.

## Next Steps

- Read full [README.md](README.md)
- Check [INSTALL.md](INSTALL.md) for advanced setup
- See [CONTRIBUTING.md](CONTRIBUTING.md) to contribute

## Need Help?

- GitHub Issues: https://github.com/cumulus13/color-notify/issues
- Email: cumulus13@gmail.com

Enjoy Color Notify! 🎨✨
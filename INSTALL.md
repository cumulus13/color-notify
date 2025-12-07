# Installation Guide

## Quick Install

```bash
pip install color-notify
```

## From Source

```bash
# Clone repository
git clone https://github.com/cumulus13/color-notify.git
cd color-notify

# Install
pip install .
```

## Development Install

```bash
# Clone repository
git clone https://github.com/cumulus13/color-notify.git
cd color-notify

# Install in editable mode
pip install -e .
```

## Requirements

- Python 3.6 or higher
- PyQt5 5.15.0 or higher
- pynput 1.7.6 or higher (for global hotkey)

### Platform-Specific Notes

#### Windows
No additional requirements. Global hotkey works out of the box.

#### macOS
```bash
# If you encounter PyQt5 issues, try:
pip install --upgrade pip setuptools wheel
pip install PyQt5

# For global hotkey support, grant accessibility permissions:
# System Preferences → Security & Privacy → Accessibility
# Add Python or Terminal to the list
```

#### Linux
```bash
# Ubuntu/Debian
sudo apt-get install python3-pyqt5

# Or via pip
pip install PyQt5

# For global hotkey support
pip install pynput

# Some systems may need additional permissions for keyboard monitoring
```

## Verify Installation

```bash
# Check if installed
pip show color-notify

# Run the application
color-notify
```

## Upgrading

```bash
pip install --upgrade color-notify
```

## Uninstall

```bash
pip uninstall color-notify
```

## Troubleshooting

### PyQt5 Installation Issues

If you encounter issues installing PyQt5:

```bash
# Try upgrading pip first
pip install --upgrade pip

# Then install PyQt5
pip install PyQt5
```

### Permission Issues

```bash
# Use --user flag
pip install --user color-notify
```

### Virtual Environment (Recommended)

```bash
# Create virtual environment
python -m venv venv

# Activate
source venv/bin/activate  # Linux/macOS
venv\Scripts\activate     # Windows

# Install
pip install color-notify
```

## Running on Startup

### Windows
1. Press `Win + R`
2. Type `shell:startup`
3. Create shortcut to `color-notify`

### Linux (systemd)
Create `~/.config/systemd/user/color-notify.service`:

```ini
[Unit]
Description=Color Notify

[Service]
ExecStart=/path/to/python -m color_notify
Restart=on-failure

[Install]
WantedBy=default.target
```

Enable:
```bash
systemctl --user enable color-notify
systemctl --user start color-notify
```

### macOS
Create `~/Library/LaunchAgents/com.color-notify.plist`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.color-notify</string>
    <key>ProgramArguments</key>
    <array>
        <string>/path/to/python</string>
        <string>-m</string>
        <string>color_notify</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
</dict>
</plist>
```

Load:
```bash
launchctl load ~/Library/LaunchAgents/com.color-notify.plist
```
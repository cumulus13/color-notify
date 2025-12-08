# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.10] - 2025-12-08

### Added
- **Smart Focus Management** ⭐
  - Focus automatically returns to previous window when canceling (Escape)
  - Optional auto-hide after color selection
  - Seamless workflow - no manual window switching needed
  - New config option: `auto_hide_after_pick`
- **Smart Color Dialog Positioning**
  - Qt Color Dialog now opens next to Color Picker (not overlapping!)
  - Configurable position: left, right, top, bottom
  - Auto-fallback if preferred position doesn't fit screen
  - Multi-monitor aware positioning
  - New config section `[color_picker]` with `color_dialog_position` option
  - **Global Keyboard Shortcut** - `Ctrl+Alt+Shift+C` to open Color Picker from anywhere
  - **System tray menu integration** - "🎨 Color Picker" menu item with shortcut hint
  - Uses `pynput` library for true system-wide hotkey
  - Works in any application
  - Cross-platform support (Windows, macOS, Linux)
  - Graceful fallback if pynput not installed

## [1.0.2-1.0.5] - 2025-12-06

### Added
- **Color Picker Dialog** - Interactive color selection tool
  - Qt color dialog integration
  - Manual hex input with validation
  - Auto-copy selected colors to clipboard
  - Live clipboard detection and auto-update
  - Color preview with name display
  - Keyboard shortcuts (Q/Escape to close, A for AOT toggle)
  - Multi-monitor support with auto-centering
- **System tray menu integration** - "🎨 Color Picker (Ctrl+Alt+Shift+C)" menu item
- **Two modes of operation** - Passive monitoring + Active picking
- **GlobalHotkeyHandler class** - Separate handler for global hotkeys
- **Cleanup on exit** - Proper hotkey listener cleanup

### Changed
- Enhanced system tray menu with color picker at top and shortcut hint
- Improved application structure with separate ColorPickerDialog class
- Better window management for color picker dialog
- About dialog now shows global shortcut information
- Requirements now include `pynput>=1.7.6` for global hotkey support

### Technical
- Uses `pynput.keyboard.HotKey` for cross-platform hotkey support
- Qt signal/slot connection for hotkey activation
- Proper listener cleanup on application exit
- Graceful degradation if pynput not available

### Documentation
- Added GLOBAL_HOTKEY_SETUP.md - Complete setup guide for all platforms
- Updated all documentation with global hotkey information
- Platform-specific setup instructions
- Troubleshooting guide for hotkey issues

### Features
- Global shortcut works system-wide from any application
- Color picker monitors clipboard every second
- Always on top mode with keyboard toggle (A / Shift+A)
- Press Enter in hex input to set color
- Window auto-centers on screen after flag changes
- Seamless integration with notification system

## [1.0.1] - 2025-12-06

### Fixed
- Clipboard access conflict warnings on Windows
- Improved error handling for clipboard access
- Reduced default polling interval from 500ms to 1000ms for better stability
- Repair mismatch icon path
- Correct config file path

### Changed
- More robust clipboard error handling with automatic interval adjustment
- Silent error handling to prevent console spam
- Better documentation for Windows users

### Added
- TROUBLESHOOTING.md with comprehensive solutions
- Automatic polling interval increase on persistent errors
- Error counter to detect persistent clipboard issues

## [1.0.0] - 2025-12-06

### Added
- Initial release
- HEX color detection (#RRGGBB, #RGB format)
- RGB color detection (rgb(r, g, b) format)
- Growl-style notifications with fade in/out animations
- System tray integration with icon and menu
- Configurable notification position (9 positions)
- Configurable transparency/opacity
- Configurable auto-hide timeout (0 = no auto-hide)
- Always on top mode (configurable)
- Pause/Resume monitoring from tray menu
- Click to dismiss notifications
- Smart text color (auto black/white based on luminance)
- Luminance calculation and display
- Configuration file support (.color-notify.ini or color-notify.ini)
- Config reload without restart
- Open config file from tray menu
- Test notification feature
- Cross-platform support (Windows, macOS, Linux)
- Configurable clipboard polling interval
- RGB validation (0-255 range check)

### Features
- **Detection**: Automatically detects color codes in clipboard
- **Notification**: Beautiful borderless notifications with color background
- **Positioning**: 9 flexible positions on screen
- **Transparency**: Adjustable opacity from 0.0 to 1.0
- **Timeout**: Configurable auto-hide (0 = stay until clicked)
- **Monitoring**: Can be paused/resumed without closing app
- **Configuration**: Easy INI file configuration
- **Tray Icon**: System tray integration for background operation

### Technical Details
- Built with PyQt5
- Frameless windows with rounded corners
- Smooth fade animations using QPropertyAnimation
- Clipboard monitoring with Qt signals
- INI configuration parser
- Cross-platform file opening
- Smart luminance-based text color selection

## [Unreleased]

### Planned Features
- HSL color format detection
- Sound notification option
- Color history logging
- Multiple color detection in single clipboard
- Color palette export
- Custom notification templates
- Keyboard shortcuts
- Notification click actions (copy, open in color picker, etc.)
- Dark/Light mode themes
- Multiple monitor support with position per monitor
- Notification stacking/queuing
- Statistics (colors detected, most used colors)

---

[1.0.0]: https://github.com/cumulus13/color-notify/releases/tag/v1.0.0

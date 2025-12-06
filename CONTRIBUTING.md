# Contributing to Color Notify

Thank you for your interest in contributing to Color Notify! 🎨

## How to Contribute

### Reporting Bugs

If you find a bug, please open an issue on GitHub with:
- A clear title and description
- Steps to reproduce
- Expected vs actual behavior
- Your OS and Python version
- Screenshots if applicable

### Suggesting Features

Feature suggestions are welcome! Please:
- Check existing issues first
- Explain the use case
- Describe the proposed solution
- Consider implementation complexity

### Pull Requests

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Test thoroughly
5. Commit with clear messages (`git commit -m 'Add amazing feature'`)
6. Push to your fork (`git push origin feature/amazing-feature`)
7. Open a Pull Request

### Development Setup

```bash
# Clone your fork
git clone https://github.com/YOUR_USERNAME/color-notify.git
cd color-notify

# Create virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install in development mode
pip install -e .

# Run the app
python -m color_notify
```

### Code Style

- Follow PEP 8
- Use meaningful variable names
- Add comments for complex logic
- Keep functions focused and small

### Testing

Before submitting:
- Test on your OS
- Try different color formats
- Check all configuration options
- Verify tray menu functions

### Commit Messages

Use clear, descriptive commit messages:
- `feat: add HSL color detection`
- `fix: notification position on multi-monitor`
- `docs: update README examples`
- `refactor: improve color parsing`

## Code of Conduct

- Be respectful and inclusive
- Welcome newcomers
- Accept constructive criticism
- Focus on what's best for the project

## Questions?

Feel free to open an issue for questions or contact the maintainer at cumulus13@gmail.com

Thank you for contributing! 🚀
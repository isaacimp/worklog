# Work Hours Logger 📊

A lightweight zsh script for tracking work hours and tasks on macOS with an optional menu bar indicator.

![Status](https://img.shields.io/badge/status-active-success.svg)
![Platform](https://img.shields.io/badge/platform-macOS-lightgrey.svg)
![Shell](https://img.shields.io/badge/shell-zsh-blue.svg)

## ✨ Features

- ⏱️ **Track any type of session** with very simple start/stop commands
- 📝 **Log tasks and descriptions** for each session
- 🏷️ **Tag sessions** for easy categorization
- 🔴 **Menu bar indicator** (optional) - always visible session status
- 📊 **Generate reports** - daily, weekly, monthly summaries
- 🔍 **Search and filter** past sessions
- 💾 **Export data** to CSV, JSON, or Markdown
- 🎨 **Customizable ASCII art** because good things that look good are even better
- 📋 **Session templates** for repeated tasks
- 📝 **Add notes** to logged sessions

## 📋 Prerequisites

- macOS (working on more platform compatability)
- Zsh shell (default on modern macOS)
- Optional: [SwiftBar](https://github.com/swiftbar/SwiftBar) for menu bar indicator

## 🚀 Installation

### Step 1: Create Directory Structure

```bash
# Create a bin directory if you don't have one
mkdir -p ~/bin

# Create a folder for the worklog files
mkdir -p ~/worklog
cd ~/worklog
```

### Step 2: Download Files

Download or copy these files into the `~/worklog` folder:
- `worklog` - Main script
- `worklog-status.1m.sh` - Menu bar indicator (optional)

### Step 3: Make Scripts Executable

```bash
chmod +x ~/worklog/worklog
chmod +x ~/worklog/worklog-status.1m.sh
```

### Step 4: Move to PATH

```bash
# Move the main script to your bin directory
mv ~/worklog/worklog ~/bin/worklog

# Check if ~/bin is in your PATH
echo $PATH | grep "$HOME/bin"
```

**If nothing shows up, add ~/bin to your PATH:**

```bash
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

### Step 5: Test Installation

```bash
worklog
```

You should see the usage instructions with ASCII art! 🎉

## 🔴 Menu Bar Indicator Setup (Optional)

Never forget to stop your work session with a persistent menu bar indicator!

### Install SwiftBar

**Using Homebrew:**
```bash
brew install swiftbar
```

**Or download directly:**
1. Visit https://github.com/swiftbar/SwiftBar/releases
2. Download the latest `.dmg` file
3. Install SwiftBar to Applications

### Set Up the Indicator

```bash
# Copy the status indicator to SwiftBar's plugins directory
cp ~/worklog/worklog-status.1m.sh ~/Library/Application\ Support/SwiftBar/

# Make sure it's executable
chmod +x ~/Library/Application\ Support/SwiftBar/worklog-status.1m.sh
```

### Activate It

1. Launch SwiftBar (if not already running)
2. Click the SwiftBar icon in your menu bar
3. Select **"Refresh All"**

You should now see:
- 🔴 **Red dot + timer** when a session is active
- ⚪️ **White dot** when idle

> **Note:** The indicator updates every 1 minute. Change the filename to `.30s.` for 30-second updates or `.5m.` for 5-minute updates.

## 📖 Usage

### Starting a Session

```bash
# Start a simple session
worklog start "Working on documentation"

# Start with tags
worklog start "Bug fixes" --tags "development,urgent"

# Start from a template
worklog start template:daily-standup
```

### Checking Status

```bash
# See current session
worklog status

# Quick info (today's total + current session)
worklog quick
```

### Stopping a Session

```bash
worklog stop
```

This will show a preview and save to your log file.

### Managing Sessions

```bash
# List recent sessions
worklog list           # Last 7 days
worklog list 30        # Last 30 days

# Search sessions
worklog search "bug"
worklog search "feature" --tag development
worklog search "client" --days 14

# Edit a logged session
worklog edit-logged 5  # Edit session #5

# Remove a logged session
worklog remove-logged 5

# Add a note to a session
worklog note 5 "Resolved the authentication issue"

# View notes for a session
worklog notes 5
```

### Reports and Statistics

```bash
# View reports
worklog today          # Today's logged hours
worklog week           # This week's hours
worklog month          # This month's hours
worklog report 14      # Last 14 days

# Detailed statistics
worklog stats
```

### Templates

Save frequently used task descriptions:

```bash
# Save a template
worklog template save 1 "Daily standup meeting" "meetings"

# List templates
worklog template list

# Use a template
worklog template use 1
# or
worklog start template:1
```

### Exporting Data

```bash
# Export to different formats
worklog export --format csv
worklog export --format json
worklog export --format markdown

# Export filtered data
worklog export --format csv --days 30
worklog export --format json --tag development
```

### Current Session Management

```bash
# Add to current session description
worklog add "Also updated tests"

# Edit current session description
worklog edit-session

# Remove current session without logging
worklog remove
```

### Customization

```bash
# View ASCII art options
worklog ascii

# Preview an ASCII option
worklog ascii preview frieren

# Set ASCII art
worklog ascii set duck

# Create an alias for the command
worklog alias wl  # Now use 'wl' instead of 'worklog'
```

## 📁 File Locations

All worklog data is stored in your home directory:

- `~/.worklog.csv` - Main log file with all sessions
- `~/.worklog_current` - Current active session data
- `~/.worklog_config` - Configuration settings
- `~/.worklog_templates` - Saved templates
- `~/.worklog_notes` - Session notes

## 🎨 ASCII Art Options

Choose from various ASCII art characters:
- Frieren (default)
- Lucy
- Nami
- Jupiter
- Duck
- Cat
- Snoopy
- And more!

```bash
worklog ascii show    # See all options
```

## 🔧 Troubleshooting

### Command not found

```bash
# Check if worklog is in the right place
ls -l ~/bin/worklog

# Check if ~/bin is in PATH
echo $PATH | grep "$HOME/bin"

# If not, add it
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

### Menu bar indicator not showing

```bash
# Verify file location and permissions
ls -la ~/Library/Application\ Support/SwiftBar/worklog-status.1m.sh

# Make sure it's executable
chmod +x ~/Library/Application\ Support/SwiftBar/worklog-status.1m.sh

# Refresh SwiftBar
# Click SwiftBar menu bar icon → "Refresh All"
```

### Menu bar indicator not updating

```bash
# Check if SwiftBar is running
ps aux | grep SwiftBar

# Check if the current session file exists when you have an active session
ls -l ~/.worklog_current

# Try refreshing SwiftBar manually from the menu bar
```

### Permission errors

```bash
# Make sure scripts are executable
chmod +x ~/bin/worklog
chmod +x ~/Library/Application\ Support/SwiftBar/worklog-status.1m.sh
```

### Data/log file issues

```bash
# Check if log file exists
ls -l ~/.worklog.csv

# View current session (if any)
cat ~/.worklog_current

# Edit log file directly if needed
open ~/.worklog.csv
```

## 📊 Log File Format

The log file uses CSV format with the following columns:

```csv
StartDate,StartTime,EndDate,EndTime,Duration,Task,Tags
2025-10-15,09:00,2025-10-15,11:30,2:30,"Working on documentation","docs,writing"
2025-10-15,13:00,2025-10-15,15:45,2:45,"Bug fixes","development,urgent"
```

This format makes it easy to:
- Import into spreadsheet applications
- Analyze with data tools
- Back up and share

## Tips

1. **Use tags consistently** - Makes searching and filtering much easier
2. **Set up templates** for recurring tasks
3. **Enable the menu bar indicator** - You'll never forget to stop a session
4. **Create an alias** - `worklog alias wl` for faster typing
5. **Regular exports** - Back up your data monthly with `worklog export --format csv`
6. **Use quick info** - `worklog quick` for a fast daily summary
7. **Add notes** after completing sessions for better context later

## 📝 License

Do what you want

## 🙏 Credits

Created with ☕ for tracking fun work hours

---

**Happy tracking! 🚀**

*Remember: The best productivity tool is the one you actually use consistently. This tool is made with that in mind. It is simple, customizable, fun and it works.*

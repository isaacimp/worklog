# Work Hours Logger
## A zsh script for tracking hours and tasks on Mac

### Mac
- Download or copy and paste the .sh file
- chmod +x ~/worklog

**Create bin directory if it doesn't exist**
- mkdir -p ~/bin

**Move the script there**
- mv ~/worklog ~/bin/worklog

**Check if it's already in PATH**
- echo $PATH | grep "$HOME/bin"

**If nothing shows up, add it:**
- echo 'export PATH="$HOME/bin:$PATH"' >> ~/.zshrc

**Reload your shell**
- source ~/.zshrc

**Test the program:**
*The the bin directory type:*
- worklog

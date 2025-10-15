#!/bin/zsh
# <swiftbar.hideAbout>true</swiftbar.hideAbout>
# <swiftbar.hideRunInTerminal>true</swiftbar.hideRunInTerminal>
# <swiftbar.hideLastUpdated>true</swiftbar.hideLastUpdated>
# <swiftbar.hideDisablePlugin>true</swiftbar.hideDisablePlugin>
# <swiftbar.hideSwiftBar>false</swiftbar.hideSwiftBar>

CURRENT_SESSION="${HOME}/.worklog_current"

if [[ -f "$CURRENT_SESSION" ]]; then
    # Active session exists
    session_data=$(<"$CURRENT_SESSION")
    start_time=$(echo "$session_data" | cut -d'|' -f1)
    task=$(echo "$session_data" | cut -d'|' -f2-)
    current_time=$(date +%s)
    duration=$((current_time - start_time))
    
    hours=$((duration / 3600))
    minutes=$(((duration % 3600) / 60))
    
    # Truncate task if too long
    short_task=$(echo "$task" | cut -c1-30)
    [[ ${#task} -gt 30 ]] && short_task="${short_task}..."
    
    # Menu bar display (red dot + timer)
    echo "🔴 ${hours}h ${minutes}m"
    echo "---"
    echo "Task: $task"
    echo "Started: $(date -r $start_time '+%H:%M')"
    echo "Duration: ${hours}h ${minutes}m"
    echo "---"
    echo "Stop Session | shell='worklog' param1='stop' terminal=true refresh=true"
else
    # No active session
    echo "⚪️"
    echo "---"
    echo "No active session"
    echo "---"
    echo "Start Session | shell='worklog' param1='start' terminal=true"
fi

# Base16 Styling Guidelines:
# base00 - Default Background
# base01 - Lighter Background (Used for status bars)
# base02 - Selection Background
# base03 - Comments, Invisibles, Line Highlighting
# base04 - Dark Foreground (Used for status bars)
# base05 - Default Foreground, Caret, Delimiters, Operators
# base06 - Light Foreground (Not often used)
# base07 - Light Background (Not often used)
# base08 - Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
# base09 - Integers, Boolean, Constants, XML Attributes, Markup Link Url
# base0A - Classes, Markup Bold, Search Text Background
# base0B - Strings, Inherited Class, Markup Code, Diff Inserted
# base0C - Support, Regular Expressions, Escape Characters, Markup Quotes
# base0D - Functions, Methods, Attribute IDs, Headings
# base0E - Keywords, Storage, Selector, Markup Italic, Diff Changed

base00="#282c34"
base01="#353b45"
base02="#3e4451"
base03="#545862"
base04="#565c64"
base05="#abb2bf"
base06="#b6bdca"
base07="#c8ccd4"
base08="#e06c75"
base09="#d19a66"
base0A="#e5c07b"
base0B="#98c379"
base0C="#56b6c2"
base0D="#61afef"
base0E="#c678dd"
base0F="#be5046"

set -g status-left-length 32
set -g status-right-length 150
set -g status-interval 5

# default statusbar colors
set-option -g status-fg $base06
set-option -g status-bg $base01
set-option -g status-attr default

set-window-option -g window-status-fg $base04
set-window-option -g window-status-bg $base00
set -g window-status-format " #I #W"

# active window title colors
set-window-option -g window-status-current-fg $base01
set-window-option -g window-status-current-bg $base0B
set-window-option -g  window-status-current-format " #[bold]#W "

# pane border colors
set-window-option -g pane-border-fg $base03
set-window-option -g pane-active-border-fg $base0C

# message text
set-option -g message-bg $base00
set-option -g message-fg $base0C

# pane number display
set-option -g display-panes-active-colour $base0C
set-option -g display-panes-colour $base01

# clock
set-window-option -g clock-mode-colour $base0C

tm_session_name="#[default,bg=$base08,fg=$base01] #S "
set -g status-left "$tm_session_name"

battery="#(~/.tmux/battery)"
tm_battery="#[fg=$base01,bg=$base09] ♥ $battery"
tm_date="#[default,bg=$base02,fg=$base05] %R"
tm_host="#[fg=$base01,bg=$base0E] #h "
set -g status-right "$tm_battery $tm_date $tm_host"

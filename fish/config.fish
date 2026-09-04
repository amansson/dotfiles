if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Homebrew
if test -d /opt/homebrew/bin
    fish_add_path /opt/homebrew/bin /opt/homebrew/sbin
end

# Aliases
alias ls "eza"
alias ll "eza -la"
alias lg "lazygit"
alias ld "lazydocker"

# Prompt
if type -q starship
    starship init fish | source
end

# Directory jumping
if type -q zoxide
    zoxide init fish | source
end

# Node.js version management
if type -q fnm
    fnm env --use-on-cd | source
end

# lazygit
alias lg='lazygit'

# fastfetch
alias ff='fastfetch'

# eza
alias ls='eza -Bbh --icons=auto'
alias l='eza -lBbgh --icons=auto'
alias ll='eza -lBbgha --icons=auto'

# yazi wrapper
function f() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# vscode
alias code='/opt/code/VSCode/bin/code --ozone-platform-hint=auto --enable-wayland-ime'


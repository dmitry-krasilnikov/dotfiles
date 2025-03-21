$env.config.show_banner = false
$env.config.edit_mode = "vi"
$env.config.completions.algorithm = "fuzzy"

const NU_LIB_DIRS = $NU_LIB_DIRS ++ [ "~/.nix-profile/share/nu_scripts" ]

$env.PATH = [ "/nix/var/nix/profiles/default/bin", "~/.nix-profile/bin", "~/.bin", "~/.local/bin", "~/.cargo/bin", "~/go/bin" ] ++ $env.PATH
$env.PAGER = "batcat"

let editor = "hx"
$env.config.buffer_editor = $editor
$env.VISUAL = $editor
$env.EDITOR = $editor

def --env p [] {
  cd (fdfind --unrestricted '\.git$' --search-path ~ -x echo '{//}' | fzf)
}

# $env.config.hooks.env_change = {
#     PWD: [{|before, after| source nu-hooks/nu-hooks/direnv/config.nu }]
# }

$env.config.hooks.pre_prompt = (
  # TODO: figure out how to dynamically get the path
  # There's a command: `nix eval nixpkgs#nu_scripts.outPath` which gives the path
  # It is possible to construct the full path with `[(nix eval nixpkgs#nu_scripts.outPath | str trim --char "\""), 'share/nu_scripts/nu-hooks/nu-hooks/direnv/config.nu'] | str join "/"`, but NuShell does not allow to use it because it's not a parse time command as opposed to `source`
  $env.config.hooks.pre_prompt | append (source nu-hooks/nu-hooks/direnv/config.nu)
)

source aliases/git/git-aliases.nu

# Set colorscheme
$env.LS_COLORS = (vivid generate rose-pine-dawn)
source themes/nu-themes/rose-pine-dawn.nu

# Nix completions and useful commands
source custom-completions/nix/nix-completions.nu
source modules/nix/nix.nu

# Docker aliases and completions
source aliases/docker/docker-aliases.nu
source custom-completions/docker/docker-completions.nu

# Debian specific aliases
alias bat = batcat
alias cat = batcat
alias less = batcat
alias fd = fdfind

# Aliases to manage dot files
alias dotfiles = /usr/bin/git --git-dir=($env.HOME)/.cfg/ --work-tree=($env.HOME)
alias dotfiles-private = /usr/bin/git --git-dir=($env.HOME)/.priv_cfg/ --work-tree=($env.HOME)

# Activate Starship
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

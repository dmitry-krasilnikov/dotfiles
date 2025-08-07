$env.config.show_banner = false
$env.config.edit_mode = "vi"
$env.config.completions.algorithm = "fuzzy"

const NU_LIB_DIRS = $NU_LIB_DIRS ++ [ "~/.nix-profile/share/nu_scripts" ]

const NU_PLUGIN_DIRS = [
  "~/.nix-profile/bin"
  ($nu.current-exe | path dirname)
  ($nu.data-dir | path join 'plugins' | path join (version).version)
  ($nu.config-path | path dirname | path join 'plugins')
]

$env.PATH = [ "/nix/var/nix/profiles/default/bin", "~/.nix-profile/bin", "~/.bin", "~/.local/bin", "~/go/bin" ] ++ $env.PATH
$env.PAGER = "batcat"
$env.MANPAGER = "batcat --style=plain"
$env.PSPG_CONF = '~/.config/pspg/config.ini'

let editor = "hx"
$env.config.buffer_editor = $editor
$env.VISUAL = $editor
$env.EDITOR = $editor

# External completions with Carapace
$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
# TODO: uncomment when Carapace has been updated to version 1.3.3, other NuShell refuses to work with the generated script
# NOTE: Carapace completions can become outdated because of the stale cache
# mkdir ~/.cache/carapace
# carapace _carapace nushell | save --force ~/.cache/carapace/init.nu
source ~/.cache/carapace/init.nu

# Git
source custom-completions/git/git-completions.nu
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

# K8s
# source modules/argx/mod.nu
# source modules/kubernetes/mod.nu

# RipGrep
source custom-completions/rg/rg-completions.nu

# NuShell command aliases
alias dc = detect columns

# Debian specific aliases
alias bat = batcat
alias cat = batcat
alias less = batcat
alias fd = fdfind

# Aliases to manage dot files
alias dotfiles = /usr/bin/git --git-dir=($env.HOME)/.cfg/ --work-tree=($env.HOME)
alias dotfiles-private = /usr/bin/git --git-dir=($env.HOME)/.priv_cfg/ --work-tree=($env.HOME)

# Use `p` command to quickly switch between Git repositories
def --env p [] {
  cd (fd --unrestricted '\.git$' --search-path ~ -x echo '{//}' | fzf)
}

# Set up direnv
$env.config.hooks.pre_prompt = (
  # TODO: figure out how to dynamically get the path
  # There's a command: `nix eval nixpkgs#nu_scripts.outPath` which gives the path
  # It is possible to construct the full path with `[(nix eval nixpkgs#nu_scripts.outPath | str trim --char "\""), 'share/nu_scripts/nu-hooks/nu-hooks/direnv/config.nu'] | str join "/"`, but NuShell does not allow to use it because it's not a parse time command as opposed to `source`
  $env.config.hooks.pre_prompt | append (source nu-hooks/nu-hooks/direnv/config.nu)
)

# Activate Starship
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# TODO: figure out how to separate existing Zsh DB from the NuShell DB because the commands aren't compatible
# Activate Atuin
# mkdir ($nu.data-dir | path join "vendor/autoload")
# atuin init nu | save -f ($nu.data-dir | path join "vendor/autoload/atuin.nu")

source ~/Dev/tool-transactions-scripts/nushell/billogram.nu

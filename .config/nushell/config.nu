$env.config.buffer_editor = "hx"

def --env p [] {
  cd (fdfind --unrestricted '\.git$' --search-path ~ -x echo '{//}' | fzf)
}

$env.config.hooks.pre_prompt = (
  # TODO: figure out how to dynamically get the path
  # There's a command: `nix eval nixpkgs#nu_scripts.outPath` which gives the path
  # It is possible to construct the full path with `[(nix eval nixpkgs#nu_scripts.outPath | str trim --char "\""), 'share/nu_scripts/nu-hooks/nu-hooks/direnv/config.nu'] | str join "/"`, but NuShell does not allow to use it because it's not a parse time command as opposed to `source`
  $env.config.hooks.pre_prompt | append (source /nix/store/xl12dmwabr1d1jfmk36pqnr6d4hq2mwd-nu_scripts-0-unstable-2025-02-28/share/nu_scripts/nu-hooks/nu-hooks/direnv/config.nu)
)

source /nix/store/xl12dmwabr1d1jfmk36pqnr6d4hq2mwd-nu_scripts-0-unstable-2025-02-28/share/nu_scripts/aliases/git/git-aliases.nu

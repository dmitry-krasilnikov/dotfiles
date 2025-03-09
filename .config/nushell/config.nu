$env.config.buffer_editor = "hx"

def --env p [] {
  cd (fdfind --unrestricted '\.git$' --search-path ~ -x echo '{//}' | fzf)
}

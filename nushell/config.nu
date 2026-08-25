# starship init nu | save -f $"($nu.default-config-dir)/tools/starship.nu"
source $"($nu.default-config-dir)/tools/starship.nu"
# carapace _carapace nushell | save -f $"($nu.default-config-dir)/tools/carapace.nu"
source $"($nu.default-config-dir)/tools/carapace.nu"
# fzf --nushell | save -f $"($nu.default-config-dir)/tools/fzf.nu"
source $"($nu.default-config-dir)/tools/fzf.nu"
# atuin init nu | save -f $"($nu.default-config-dir)/tools/atuin.nu"
source $"($nu.default-config-dir)/tools/atuin.nu"
# zoxide init nushell | save -f $"($nu.default-config-dir)/tools/zoxide.nu"
source $"($nu.default-config-dir)/tools/zoxide.nu"


source $"($NU_SCRIPTS_DIR)/themes/nu-themes/catppuccin-macchiato.nu"

# fnm初始化
source $"($NU_SCRIPTS_DIR)/modules/fnm/fnm.nu"

# 自动补全打补丁
source $"($NU_SCRIPTS_DIR)/custom-completions/uv/uv-completions.nu"
source $"($NU_SCRIPTS_DIR)/custom-completions/zellij/zellij-completions.nu"
# source $"($NU_SCRIPTS_DIR)/custom-completions/zoxide/zoxide-completions.nu"

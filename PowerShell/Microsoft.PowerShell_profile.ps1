# powershell 开发配置
# 作者：虞颖健
# 时间：26.08.11
# *_STR_LOC <=> * STORE LOCATION 防止与软件包的环境变量名重复 HOME DIR使用太多
chcp 65001 | Out-null

$env:Path = [Environment]::GetEnvironmentVariable('Path', 'Machine') + ';' + [Environment]::GetEnvironmentVariable('Path', 'User')

# 开发工具目录设置
$DEV_STR_LOC = "D:\dev"
# $profile 每次加载都会重置path

# 开发工具可执行文件符号链接
$SHIMS_STR_LOC = "$DEV_STR_LOC\shims"
$env:path = "$SHIMS_STR_LOC;$SHIMS_STR_LOC\microsoft-coreutils;$env:path"

# powershell 常用脚本
$PS_SCRIPTS_STR_LOC = "$DEV_STR_LOC\powershell_scripts"
$env:path = "$PS_SCRIPTS_STR_LOC;$env:path"


# XDG 配置（很多工具支持，配置文件等不再占用C盘空间，配置放在其它工具运行初始化前）
$XDG_STR_LOC="$DEV_STR_LOC\XDG_STR_LOC"
## 核心必设
$env:XDG_DATA_HOME="$XDG_STR_LOC\XDG_DATA_HOME"
$env:XDG_CONFIG_HOME="$XDG_STR_LOC\XDG_CONFIG_HOME"
$env:XDG_CACHE_HOME="$XDG_STR_LOC\XDG_CACHE_HOME"
$env:XDG_RUNTIME_DIR="$XDG_STR_LOC\XDG_RUNTIME_DIR"
## 系统搜索路径
$env:XDG_DATA_DIRS="$XDG_STR_LOC\XDG_DATA_DIRS"
$env:XDG_CONFIG_DIRS="$XDG_STR_LOC\XDG_CONFIG_DIRS"
## 扩展规范
$env:XDG_STATE_HOME="$XDG_STR_LOC\XDG_STATE_HOME"
$env:XDG_BIN_HOME="$XDG_STR_LOC\XDG_BIN_HOME"
$env:path = "$env:XDG_BIN_HOME;$env:path"	# $env:XDG_BIN_HOME 加入PATH

# 编程语言环境设置
$DEV_LANGS_STR_LOC = "$DEV_STR_LOC\langs"
## node 编程环境配置
### fnm 配置
$FNM_STR_LOC = "$DEV_LANGS_STR_LOC\fnm"
$env:FNM_VERSION_FILE_STRATEGY = "local"
$env:FNM_DIR = $FNM_STR_LOC
#$env:path = "$env:FNM_DIR;$env:path"	# $env:FNM_DIR关联设置
$env:FNM_LOGLEVEL = "info"
$env:FNM_NODE_DIST_MIRROR = "https://mirrors.huaweicloud.com/nodejs"
$env:FNM_COREPACK_ENABLED = "false"
$env:FNM_RESOLVE_ENGINES = "true"
$env:FNM_ARCH = "x64"
### npm 配置
$env:NPM_CONFIG_GLOBALCONFIG="$DEV_LANGS_STR_LOC\npm\global.npmrc"
$env:NPM_CONFIG_USERCONFIG="$DEV_LANGS_STR_LOC\npm\.npmrc"
$env:NPM_CONFIG_CACHE="$DEV_LANGS_STR_LOC\npm\cache"
$env:NPM_CONFIG_REGISTRY="https://registry.npmmirror.com/"
## $env:NPM_CONFIG_PREFIX 使用fnm生成的，不设置
### pnpm 配置 - pnpm 在 Windows 上完整支持 XDG，不需要配置
## python 编程环境配置
### UV 配置
$UV_STR_LOC = "$DEV_LANGS_STR_LOC\uv"
#$env:path = "$UV_STR_LOC;$env:path"	# $UV_STR_LOC关联设置 
$env:UV_PYTHON_INSTALL_MIRROR = "https://registry.npmmirror.com/-/binary/python-build-standalone"
$env:UV_DEFAULT_INDEX = "https://mirrors.aliyun.com/pypi/simple"
$env:UV_INDEX_URL = "https://mirrors.aliyun.com/pypi/simple"
$env:UV_CACHE_DIR = "$UV_STR_LOC\UV_CACHE_DIR"
$env:UV_PYTHON_INSTALL_DIR = "$UV_STR_LOC\UV_PYTHON_INSTALL_DIR"
$env:UV_TOOL_DIR = "$UV_STR_LOC\UV_TOOL_DIR"
$env:UV_INSTALL_DIR="$UV_STR_LOC"
$env:UV_CONFIG_FILE = "$UV_STR_LOC\uv.toml"
#### uv.toml的内容
#[[index]]
#url = "https://mirrors.aliyun.com/pypi/simple"
#default = true
## go 编程环境配置
### g 配置
$G_STR_LOC = "$DEV_LANGS_STR_LOC\g"
$env:G_HOME = $G_STR_LOC
$env:G_MIRROR = "https://golang.google.cn/dl/"
$env:G_EXPERIMENTAL = "true"	# 开启实验特性（必须）
### go 环境变相设置
$env:GOROOT = "$G_STR_LOC\go"
$env:GOCACHE = "$G_STR_LOC\go_cache"
$env:GOENV= "$G_STR_LOC\go_env"
$env:GOPATH = "$G_STR_LOC\go_path"
$env:GOPROXY = "https://goproxy.cn,direct"
$env:path = "$env:GOROOT\bin;$env:GOPATH\bin;$env:path"
## rust 编程环境配置
$RUST_STR_LOC = "$DEV_LANGS_STR_LOC\rust"
$env:RUSTUP_DIST_SERVER = "https://rsproxy.cn"
$env:RUSTUP_UPDATE_ROOT = "https://rsproxy.cn/rustup"
$env:RUSTUP_HOME = "$RUST_STR_LOC\rustup"
$env:CARGO_HOME = "$RUST_STR_LOC\cargo"
$env:path = "$RUST_STR_LOC\cargo\bin;$env:path"
### 编辑 $CARGO_HOME/config.toml 文件，添加以下内容：
#[source.crates-io]
#replace-with = 'rsproxy-sparse'
#[source.rsproxy]
#registry = "https://rsproxy.cn/crates.io-index"
#[source.rsproxy-sparse]
#registry = "sparse+https://rsproxy.cn/index/"
#[registries.rsproxy]
#index = "https://rsproxy.cn/crates.io-index"
#[net]
#git-fetch-with-cli = true

# cli工具配置
## zellij 配置
$ZELLIJ_STR_LOC = "$DEV_STR_LOC\cli\zellij"
$env:ZELLIJ_CONFIG_DIR = "$ZELLIJ_STR_LOC\config_pwsh"
#$env:path = "$ZELLIJ_HOME;$env:path"
$OH_MY_POSH_STR_LOC = "$DEV_STR_LOC\cli\oh-my-posh"
$env:OMP_CACHE_DIR = "$OH_MY_POSH_STR_LOC\cache"
$env:POSH_THEMES_PATH = "$OH_MY_POSH_STR_LOC\themes"
## atuin 配置
$ATUIN_STR_LOC = "$DEV_STR_LOC\cli\atuin"
$env:ATUIN_CONFIG_DIR = "$ATUIN_STR_LOC\config"
## zoxide 配置
$ZOXIDE_STR_LOC = "$DEV_STR_LOC\cli\zoxide"
$env:_ZO_DATA_DIR = "$ZOXIDE_STR_LOC\data"
$env:_ZO_ECHO = 1


# ide & editor 配置
$DEV_EDITOR_STR_LOC = "$DEV_STR_LOC\editor"
## zed 配置
$ZED_STR_LOC = "$DEV_EDITOR_STR_LOC\zed"
## Notepad3 配置
$NOTEPAD3_STR_LOC = "$DEV_EDITOR_STR_LOC\Notepad3"
## vscode 配置
$VSCODE_STR_LOC = "$DEV_EDITOR_STR_LOC\vscode"

# AI编程工具
## opencode 配置
$OPENCODE_STR_LOC = "$DEV_STR_LOC\ai\opencode"
## pi 配置
$PI_STR_LOC = "$DEV_STR_LOC\ai\pi"
$env:PI_CODING_AGENT_DIR = "$PI_STR_LOC\config"   # 配置
## codex 配置
$CODEX_STR_LOC = "$DEV_STR_LOC\ai\codex"
$env:CODEX_HOME = $CODEX_STR_LOC
## cc-switch 配置
$CC_SWITCH_STR_LOC = "$DEV_STR_LOC\ai\cc-switch"
$env:CC_SWITCH_CONFIG_DIR = "$CC_SWITCH_STR_LOC\config"

## rtk 配置
$RTK_STR_LOC = "$DEV_STR_LOC\ai\rtk"

# powershell 模块配置
## 安装模块
$modulesNeedInstall = @(
	# "Terminal-Icons",
	"PSReadLine",
	"PSFzf"
	#"PSCompletions"
	)
foreach ($m in $modulesNeedInstall) {
	if (-not (Get-PSResource -Name $m -Scope CurrentUser)) {
        Install-PSResource $m -Scope CurrentUser
    }
}
## Terminal-Icons 配置
### 安装: Import-Module -Name Terminal-Icons
# Import-Module -Name Terminal-Icons
## PSReadLine 配置
### 安装最新版powershell，自带的就可以，不需要安装
Import-Module PSReadLine
### 历史记录设置
Set-PSReadLineOption -MaximumHistoryCount 10000			# 历史记录最多保存10000条
### 自动补全设置
Set-PSReadLineOption -PredictionViewStyle ListView		# 弹出根据历史与插件的预测输入的可滚动列表
Set-PSReadLineKeyHandler Alt+/ MenuComplete				# 弹出自动补全列表快捷键设置
## PSCompletions 配置
### 安装: Install-Module PSCompletions
# Import-Module PSCompletions
#### 要检查的补全列表
# $pscLibs = @(
# 	"powershell", "zellij", "starship",
# 	"fd", "rg", "eza", "zoxide", "fzf", "bat", "jq",
# 	"git",
# 	"fnm", "node", "npm",
# 	"uv", "python", "pip",
# 	"go",
# 	"rustup", "rustc", "cargo",
# 	"opencode"
# )
# $installedNames = @()
#### 循环批量安装补全
# $pscLibs | ForEach-Object {
# 	$installed = psc list | Select-String -Pattern "Completion=$_" -SimpleMatch
#     if (-not $installed) {
#         psc add $_
#         $installedNames += $_
#     }
# }
#### 若有需要安装的补全，显示安装的补全
# if ($installedNames) {
#     Write-Host "PSCompletions本次自动安装的补全：$($installedNames -join ', ')" -ForegroundColor Green
# }
# Write-Host "PSCompletions加载的补全：$($pscLibs -join ', ')" -ForegroundColor Green
## PSFzf 配置
### 安装: Install-Module PSFzf
Import-Module PSFzf
### fzf 外观（Windows 舒适版）
$env:FZF_DEFAULT_OPTS = "--layout reverse --border rounded"
### 快捷键绑定
Set-PsFzfOption -PSReadlineChordReverseHistory Ctrl+R	# 历史命令搜索 小写r给了atuin
Set-PsFzfOption -PSReadlineChordProvider Ctrl+t			# 文件搜索
### psc menu config enable_menu_enhance 0 手动设置，要更换1请自行执行
# $psc_enable_menu_enhance = psc menu config enable_menu_enhance
# if ($psc_enable_menu_enhance -eq 0) {
# 	# 具体见：https://pscompletions.abgox.com/zh-cn/docs/tools/psfzf
# 	# PSCompletions的外部补全由PSFzf处理
# 	Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
# 	# 260723 这个设置有问题 psc的补全会变成双引号的文本 暂时还是设成1
# }
# if ($psc_enable_menu_enhance -eq 1) {
# 	# PSCompletions 和 PSFzf 自动协同，不清楚怎么个内部协同法，我暂时用0
# 	Set-PsFzfOption -TabExpansion
# }
# 各类工具加载、初始化
## starship
Invoke-Expression (& "starship.exe" init powershell --print-full-init | Out-String)
## oh-my-posh
#oh-my-posh init pwsh | Invoke-Expression
## fnm
fnm env --use-on-cd --shell powershell | Out-String | Invoke-Expression
## atuin
#atuin init powershell | Out-String | Invoke-Expression
#echo (Get-Content (Join-Path $PSScriptRoot "atuin.ps1") -Raw)
Get-Content (Join-Path $PSScriptRoot "atuin.ps1") -Raw | Invoke-Expression
## zoxide !!!必须在starship之后加载，否则不工作
Invoke-Expression (& { (zoxide init powershell | Out-String) })

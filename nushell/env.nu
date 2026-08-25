# 开发工具目录设置
const DEV_STR_LOC = "D:/dev"

# nu_scripts路径
const NU_SCRIPTS_DIR = $"($DEV_STR_LOC)/cli/nu_scripts"

# 开发工具可执行文件符号链接
const SHIMS_STR_LOC = $"($DEV_STR_LOC)/shims"
$env.PATH = ($env.PATH | prepend $SHIMS_STR_LOC)

# XDG 配置（很多工具支持，配置文件等不再占用C盘空间，配置放在其它工具运行初始化前）
let XDG_STR_LOC = $"($DEV_STR_LOC)/XDG_STR_LOC"
## 核心必设
$env.XDG_DATA_HOME = $"($XDG_STR_LOC)/XDG_DATA_HOME"
$env.XDG_CONFIG_HOME = $"($XDG_STR_LOC)/XDG_CONFIG_HOME"
$env.XDG_CACHE_HOME = $"($XDG_STR_LOC)/XDG_CACHE_HOME"
$env.XDG_RUNTIME_DIR = $"($XDG_STR_LOC)/XDG_RUNTIME_DIR"
## 系统搜索路径
$env.XDG_DATA_DIRS = $"($XDG_STR_LOC)/XDG_DATA_DIRS"
$env.XDG_CONFIG_DIRS = $"($XDG_STR_LOC)/XDG_CONFIG_DIRS"
## 扩展规范
$env.XDG_STATE_HOME = $"($XDG_STR_LOC)/XDG_STATE_HOME"
$env.XDG_BIN_HOME = $"($XDG_STR_LOC)/XDG_BIN_HOME"
# XDG_BIN_HOME 加入 PATH 最前面
$env.PATH = ($env.PATH | prepend $env.XDG_BIN_HOME)

# 编程语言环境设置
let LANGS_STR_LOC = $"($DEV_STR_LOC)/langs"
## node 编程环境配置
### fnm 配置
let FNM_STR_LOC = $"($LANGS_STR_LOC)/fnm"
$env.FNM_VERSION_FILE_STRATEGY = "local"
$env.FNM_DIR = $FNM_STR_LOC
$env.FNM_LOGLEVEL = "info"
$env.FNM_NODE_DIST_MIRROR = "https://mirrors.huaweicloud.com/nodejs"
$env.FNM_COREPACK_ENABLED = "false"
$env.FNM_RESOLVE_ENGINES = "true"
$env.FNM_ARCH = "x64"
### npm 配置
$env.NPM_CONFIG_GLOBALCONFIG = $"($LANGS_STR_LOC)/npm/global.npmrc"
$env.NPM_CONFIG_USERCONFIG = $"($LANGS_STR_LOC)/npm/.npmrc"
$env.NPM_CONFIG_CACHE = $"($LANGS_STR_LOC)/npm/cache"
$env.NPM_CONFIG_REGISTRY = "https://registry.npmmirror.com/"
## $env.NPM_CONFIG_PREFIX 使用 fnm 生成的，不设置
### pnpm 配置 - pnpm 在 Windows 上完整支持 XDG，不需要配置
## python 编程环境配置
### UV 配置
let UV_STR_LOC = $"($LANGS_STR_LOC)/uv"
$env.UV_PYTHON_INSTALL_MIRROR = "https://registry.npmmirror.com/-/binary/python-build-standalone"
$env.UV_DEFAULT_INDEX = "https://mirrors.aliyun.com/pypi/simple"
$env.UV_INDEX_URL = "https://mirrors.aliyun.com/pypi/simple"
$env.UV_CACHE_DIR = $"($UV_STR_LOC)/UV_CACHE_DIR"
$env.UV_PYTHON_INSTALL_DIR = $"($UV_STR_LOC)/UV_PYTHON_INSTALL_DIR"
$env.UV_TOOL_DIR = $"($UV_STR_LOC)/UV_TOOL_DIR"
$env.UV_INSTALL_DIR = $UV_STR_LOC
$env.UV_CONFIG_FILE = $"($UV_STR_LOC)/uv.toml"
#### uv.toml 的内容
#[[index]]
#url = "https://mirrors.aliyun.com/pypi/simple"
#default = true
#### 生成 powershell 的自动补全
#uv generate-shell-completion powershell | Out-String | Invoke-Expression
## go 编程环境配置
### g 配置
let G_STR_LOC = $"($LANGS_STR_LOC)/g"
$env.G_HOME = $G_STR_LOC
$env.G_MIRROR = "https://golang.google.cn/dl/"
$env.G_EXPERIMENTAL = "true"  # 开启实验特性（必须）
### go 环境变量设置
$env.GOROOT = $"($G_STR_LOC)/go"
$env.GOCACHE = $"($G_STR_LOC)/go_cache"
$env.GOENV = $"($G_STR_LOC)/go_env"
$env.GOPATH = $"($G_STR_LOC)/go_path"
$env.GOPROXY = "https://goproxy.cn,direct"
$env.PATH = (
  $env.PATH
  | prepend $"($env.GOROOT)/bin"
  | prepend $"($env.GOPATH)/bin"
)
## rust 编程环境配置
let RUST_STR_LOC = $"($LANGS_STR_LOC)/rust"
$env.RUSTUP_DIST_SERVER = "https://rsproxy.cn"
$env.RUSTUP_UPDATE_ROOT = "https://rsproxy.cn/rustup"
$env.RUSTUP_HOME = $"($RUST_STR_LOC)/rustup"
$env.CARGO_HOME = $"($RUST_STR_LOC)/cargo"
$env.PATH = $env.PATH | prepend $"($RUST_STR_LOC)/cargo/bin"
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
let CLI_STR_LOC = $"($DEV_STR_LOC)/cli"
## zellij 配置
let ZELLIJ_STR_LOC = $"($CLI_STR_LOC)/zellij"
$env.ZELLIJ_CONFIG_DIR = $"($ZELLIJ_STR_LOC)/config_nu"
## atuin 配置
let ATUIN_STR_LOC = $"($CLI_STR_LOC)/atuin"
$env.ATUIN_CONFIG_DIR = $"($ATUIN_STR_LOC)/config"
## zoxide 配置
let ZOXIDE_STR_LOC = $"($CLI_STR_LOC)/zoxide"
$env._ZO_DATA_DIR = $"($ZOXIDE_STR_LOC)/data"
$env._ZO_ECHO = 1

# AI编程工具
## pi 配置
let PI_STR_LOC = $"($DEV_STR_LOC)/ai/pi"
$env.PI_CODING_AGENT_DIR = $"($PI_STR_LOC)/config"   # 配置

# PATH 去重
$env.PATH = $env.PATH | uniq

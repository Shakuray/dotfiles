# Powershell dotfiles
## Setup ⚙
Most of the following packages are required. If you don't want to install any, delete the related package commands in `powershell/user_profile.ps1`

### Font 🔠
Install the latest `Hack NF` font of the [ryanoasis/nerd-fonts](https://github.com/ryanoasis/nerd-fonts) repository


### Scoop 📦
Powershell dependency manager
```
iwr -useb get.scoop.sh | iex
scoop install curl sudo jq neovim gcc
```

Edit file `$PROFILE.CurrentUserCurrentHost` and add the following line:
```
. $env:USERPROFILE\.config\powershell\user_profile.ps1
```

Set the `.config\powershell\env.ps1` enviornment variable values
```
# Env
$env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"
$env:PROJ_PATH = "C:\PROJECTS\"
$env:GP_PATH = $env:PROJ_PATH + "gestpath"
```

### Oh my posh 💻
Prompt framework
```
Install-Module posh-git -Scope CurrentUser -Force
winget install JanDeDobbeleer.OhMyPosh
```

### Terminal Icons
File icons for `ll` command
```
Install-Module -Name Terminal-Icons -Repository PSGallery -Force
Import-Module Terminal-Icons
```

### Z 🏠
Will change directory by name based on frequency and history. `z desk` will go to desktop

```
Install-Module -Name z -Force
```

### PSReadLine 🔮
Prompt autocomplete

```
Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
Set-PSReadLineOption -PredictionSource History
```

### Fuzzy finder 🔍
Find directories with `Ctrl+F` and `Ctrl+R`
```
scoop install fzf
Install-Module -Name PSFzf -Scope CurrentUser -Force
```

## Commands 🤖
`gpconfig` is a gp config swapper. See `gpconfig help` for more info.

`dockermachine` is a ssh office dockermachine shortcut

`cdc` change current directory to your code directory

`killspoty` 🔪 kills all bugged spotify processes, what else?

`killsteam` 🔪 same but for steam

## Aliases ✂️
`ll` shortcut for `ls -l`

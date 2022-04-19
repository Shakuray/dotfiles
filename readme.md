
# Powershell
## Setup ⚙
Most of the following packages are required. If you don't want to install any, delete the related package commands in `powershell/user_profile.ps1`

### Font 🔠
Install the latest `Hack NF` font of the [ryanoasis/nerd-fonts](https://github.com/ryanoasis/nerd-fonts) repository


### Scoop 📦
Powershell dependency manager
```
iwr -useb get.scoop.sh | iex
scoop install curl sudo jq
```

Edit file `$PROFILE.CurrentUserCurrentHost`
And add the following line
```
. $env:USERPROFILE\.config\powershell\user_profile.ps1
```

### Oh my posh 💻
Prompt framework
```
Install-Module push-git -Scope CurrentUser -Force
Install-Module oh-my-posh -Scope CurrentUser -Force
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

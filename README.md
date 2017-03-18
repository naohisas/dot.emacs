# dot.emacs

This repository contains my Emacs configuration files and some emacs packages stored in the .emacs.d directory for Mac and Linux.

## Installation
### dot.emacs
Copy .emacs and .emacs.d to your home directory.
```
$ cp -a .emacs* ~/
```
Change local variables in ~/.emacs to your name and email address.
```
;; Set local variables
(setq user-full-name    "Your name")
(setq user-mail-address "Your email address")
```
### Emacs in Mac OS
Older version of Emacs is iinstalled by default with Mac OS. So it is suggested you to install new one on your Mac.
<br>
Emcas can be installed with Homebrew in Mac.
```
$ brew cask install emacs
```
Installed Emacs.app can be opened from Terminal.
```
$ open -a /Application/Emacs.app
```
The following alias is usefull. Add these lines to your .profile (or .bash_profile, etc) at home directory
```
alias emacs="open -a /Applications/Emacs.app"
```

## Customization
Appearance of emacs can be changed by modifying ~/.emacs.d/listp/config_appearance.el.

# dot.emacs

This repository contains my Emacs configuration files and some emacs packages stored in the .emacs.d directory for Mac and Linux.

## Installation
Fist of all, simply download dot.emacs from this site by clinking the green button "Clone or download" or directly clone it on Terminal as follows:
```
$ git clone https://github.com/naohisas/dot.emacs.git
```
### dot.emacs
Copy ".emacs" and ".emacs.d" to your home directory.
```
$ cd dot.emacs
$ cp -a .emacs* ~/
```
Change the following local variables in ~/.emacs to your name and email address.
```
;; Set local variables
(setq user-full-name    "Your name")
(setq user-mail-address "Your email address")
```
### Emacs in Mac OS
Older version of Emacs (Emacs22) is iinstalled by default with Mac OS. So it is suggested you to install new one on your Mac.
<br>
New Emcas (Emacs 25.1) can be installed with Homebrew in Mac.
```
$ brew cask install emacs
```
The installed Emacs.app can be opened from Terminal.
```
$ open -a /Application/Emacs.app
```
The following alias is optional, but it's recommended if you like to start by typing 'emacs' on Terminal. Create a alias in your shell. To make it permanen, put that line to your .profile (or .bash_profile, etc) at home directory
```
$ alias emacs="open -a /Applications/Emacs.app"
```

## Customization
Appearance of emacs can be changed by modifying ~/.emacs.d/listp/config_appearance.el.

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
```cl:.emacs
(setq user-full-name    "Your name")
(setq user-mail-address "Your email address")
```
### Emacs for Mac
Older version of Emacs (Emacs22) is iinstalled by default with Mac OS. So it is suggested you to install new one on your Mac.
<br><br>
New Emcas (Emacs 25.1) can be installed with Homebrew in Mac.
```
$ brew tap caskroom/cask
$ brew cask install emacs
```
For Apple M1, Emacs can be installed as follows:
```
$ brew install --cask emacs
```
The installed Emacs.app can be opened from Terminal.
```
$ open -a /Application/Emacs.app
```
The following alias is optional, but it's recommended if you like to start by typing 'emacs' on Terminal. Create the alias in your shell. To make it permanent, put that line to your .profile (or .bash_profile, etc) at home directory
```
$ alias emacs="open -a /Applications/Emacs.app"
```

## Customization
Appearance of emacs can be changed by modifying ~/.emacs.d/listp/config_appearance.el.
<br><br>
To change colors (foreground, background, etc.), modify the frame parameters in the variable `default-frame-alist`
```cl:config_appearance.el
(setq default-frame-alist
      (append
       (list
        '(top . 0)
        '(left . 0)
        '(foreground-color . "black")
        '(background-color . "wheat")
        '(border-color .     "black")
        '(mouse-color .      "white")
        '(cursor-color .     "black"))
       default-frame-alist))
```
To change modeline color, modify the following colors.
```cl:config_appearance.el
(set-face-foreground 'mode-line "#ffffff")
(set-face-background 'mode-line "#b40000")
```
To enable menu bar, turn on `menu-bar-mode`.
```cl:config_appearance.el
(menu-bar-mode 1)
```
To enable tool bar, turn on `tool-bar-mode`.
```cl:config_appearance.el
(tool-bar-mode 1)
```
## Global Settings for Mac
To be enabled to scroll up/down by block and select a region on Emacs by using control + arrows and space, disable several shortcuts for Misson Control and Spotlight in System Preferances.
1. Open "System Preferences"
1. Click "Keyboard" in Hardware
1. Select "Misson Control" in the Shortcuts tab
1. Uncheck "Mission Control" and "Application windows"
1. Uncheck "Move left a space" and "Move right a space"
1. Select "Spotlight" in the Shortcuts tab
1. Uncheck "Show Spotlight search"

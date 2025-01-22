# My Dotfiles

This directory contains my personal dotfiles, which I use on a daily basis.

---

## Requirements 
Ensure that you have the following tools installed:

### Git

```bash
pacman -S git
```

### Stow
```bash
pacman -S stow
```
--- 

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
$ git clone git@github.com/sirjager/dotfiles.git
$ cd dotfiles
```

then use GNU stow to create symlinks

```
$ stow .
```

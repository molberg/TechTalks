Date: 2018-01-15
Title: Tmux - a terminal multiplexer
Tags: tmux
Author: Franz Kirsten

 * The slides are in this [tmux.pdf]({static}/docs/tmux.pdf)
 * if you know `screen`: `tmux` is a similar thing but I like it a lot more
 * [`tmux` vs `screen` cheat sheet](http://www.dayid.org/comp/tm.html)

## What is it?

### Wikipedia

> `tmux` is a software application that can be used to multiplex several
> virtual consoles, allowing a user to access multiple separate
> terminal sessions inside a single terminal window or remote
> terminal session

### Github

[tmux wiki](https://github.com/tmux/tmux/wiki)
> `tmux` is a terminal multiplexer. It lets you switch easily between
> several programs in one terminal, detach them (they keep
> running in the background) and reattach them to a different
> terminal. And do a lot more

## Tmux - what I use it for
 * it helps me to organise my desktop in such a way, that I have only
   one terminal open but still as many terminal sessions as I please
 * it allows me to start jobs on remote machines and have them run
   overnight without me having to stay logged in
 * it has X-forwarding capabilies if needed

## Get it, docs, manuals
* linux distributions like Ubuntu ship it as a package (get it via apt-get)
* on remote clusters without root permissions you might need to
  compile it yourself (really easy!)
    * get it from the [tmux github page](https://github.com/tmux/tmux/wiki)
    * before you compile `tmux` you'll need to build
      [libevent](https://sourceforge.net/projects/levent/?source=directory)
    * you'll also need [ncurses](https://github.com/gittup/ncurses)
* for quick references on key-bindings use, e.g.,
  this [cheat sheet](http://tmuxcheatsheet.com/)
  or [this one here](https://gist.github.com/MohamedAlaa/2961058)
* you can configue key-bindings and like by creating a file called
  `.tmux.conf` in your `$HOME` directory

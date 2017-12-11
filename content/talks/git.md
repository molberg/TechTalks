Date: 2017-12-11
Title: Git version control system
Tags: git
Author: Michael Olberg

## The Abomination

```
foo.txt
foo1.txt
foo1_john.txt
foo2_jane_feb12.txt
foo2_jane_feb12_with_additional_comments_by_john.txt
```

__Please. don't. do. this!__

## History

The competition

 * `rcs` revision control system
 * `cvs` concurrent versions system
 * `svn` subversion
 * `hg` mercurial

... and the winner is:

  * `git` developed in 2005 by Linus Torvalds, used for the
    development of the Linux kernel
  * excellent documentation (including a whole book) at [the git home page](https://git-scm.com/)

## Before you start

Required configuration, will be written to file `.gitconfig` in your home directory:

```
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
```

## The Git work flow

![work flow]({filename}/images/areas.png)

## Local repositories

At the observatory, we currently have two setups which you are welcome
to use as a remote repository for projects you don't want world
readable (else [github](https://github.com/) is an excellent choice).

 * `git` server on `nain.oso.chalmers.se`. I need to manually
   setup the repository for you and will need your public(!)  ssh key
   to allow accesss. No web interface.
 * `gitlab` server on `skjold.oso.chalmers.se`. Again, I will need
   your public ssh key to allow accesss, but you administer the
   repository via a web interface.

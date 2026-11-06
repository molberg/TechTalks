Date: 2017-12-04
Title: Lyx
Tags: lyx, latex, overleaf
Author: Franz Kirsten

## Lyx - document editor based on latex

### Overview
  * encourages writing based on the idea of what-you-see-is-what-you-mean [WYSIWYM](http://en.wikipedia.org/wiki/WYSIWYM)
  * find it at [Lyx](http://www.lyx.org/)
  * the [Documentation/Wiki](https://wiki.lyx.org/) is great
  * allows you to write a LaTeX document without ever having to remember latex-commands

### Features
  * import of LaTeX files
  * export of Lyx-files to LaTeX
  * vast amount of document classes
  * renders your input immediately (e.g. mathmatical symbols apear as such)
  * implement your own classes (e.g. A&A, MNRAS, ApJ...)
  * can be used in conjunction with [Overleaf]({static}/talks/overleaf.md)

### Example of how to implement a class
  * the below works on Ubuntu
  * open a terminal and run the following commands (replace class.cls by your class-file)
```
cp /path/to/class.cls /usr/local/share/texmf/tex/latex/ # might need to create the directory first
chmod 655 /usr/local/share/texmf/tex/latex/class.cls    # makes the file readable
sudo texhash                                            # texhash needs to be run as root, hence sudo

```
  * after these steps start lyx, in the menu go to tools --> reconfigure
  * restart lyx

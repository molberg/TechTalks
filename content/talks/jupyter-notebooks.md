Date: 2018-03-22
Title: Coding in python in a Jupyter Notebook
Tags: jupyter, python
Author: Franz Kirsten

 * I made some slides showing how to [get started]({static}/docs/jupyter.pdf)
 * check out the [jupyter website](https://jupyter.org/) for docs and the like
 * for further info on the jupyter extensions check out [their github page](https://github.com/ipython-contrib/jupyter_contrib_nbextensions)
 * feel free to download and play around with the [notebook we worked on]({static}/code/jupyter.tar.gz); (tarball contains both the notebook and the fits file)

## Installation

 * assuming you have 'pip' installed run the following

```
pip jupyter install
```
 * if you'd like to use the extensions we discussed you'll also need to
```
pip install jupyter_contrib_nbextensions
jupyter contrib nbextension install --user
```
 * optionally you can also create a config file like so
```
jupyter notebook --generate-config
```
 * this is useful in case you want to run jupyter not in your default web browers; to get this to work you'll need to modify the file ```$HOME/.jupyter/jupyter_notebook_config.py``` by changing the follwing line according to your needs: ```c.NotebookApp.browser = '/usr/bin/browser'```
 * if you'd like to make use of widgets like ipywidget you'll need to have them install and enable them in jupyter:
```
pip install ipywidgets
jupyter nbextension enable --py widgetsnbextension
```

## start/stop a notebook
 * from a console run ```jupyter notebook```
 * this will open up a tab in your favourite web browser, check out the [pdf]({static}/docs/jupyter.pdf) on how to continue from here
 * to stop the jupyter server you have to hit Ctrl-c

## Run jupyter on remote machine

 * let's assume you need to run/test code on a remote machine and you want to do this in jupyter notebook
 * what you'll need to do is start the jupyter server like this:
   ```jupyter notebook --port=5558 --ip=127.0.0.1```
   * this will send the X-window to localhost on port 5558 (note, it does not need to be on port 5558)
 * on your local machine you create a SSH tunnel mapping the remote X-session onto some local port:
   ```ssh -L 5558:localhost:5558 user@remoteMachine```
 * you open the notebook in your browser of choice using the following as the URL:
   ```http://localhost:5558/tree#```

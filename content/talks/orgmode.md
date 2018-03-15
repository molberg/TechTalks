Date: 2018-03-01
Title: Emacs org-mode
Tags: org-mode
Author: Michael Olberg

# Org mode

Here is the document I presented, with some comments and keyboard
shortcuts added: (S stands for Shift, C stands for Ctrl, M stands for
meta (either Esc or Alt). For example `M-g` would mean, press the Esc
key first then press the g key, alternatively press Alt and g
simultaneously.

```
* Org mode
    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
    eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
    enim ad minim veniam, quis nostrud exercitation ullamco laboris
    nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
    reprehenderit in voluptate velit esse cillum dolore eu fugiat
    nulla pariatur. Excepteur sint occaecat cupidatat non proident,
    sunt in culpa qui officia deserunt mollit anim id est laborum.

shortcuts:
    M-q reformats a paragraph, but this is not org-mode specific.

** Markup 
*bold*, /italics/, =verbatim=, +strikethrough+, ~code~
 1) bulleted items
 2) another one
 3) [ ] with tick marks
 4) cycle through types
 5) [ ] another check box
 6) automatic renumbering

shortcuts:
   M-RET insert new heading or item, depending where your cursor is. 
   M-S-RET inserts new item with check box. 
   C-c toggles tick mark in check box.
   M-up/down rearrange items/headings
   M-left/right decrease/increase level of heading
   C-c - toggle through type of bullets, unnumbered and numbered.

** To do items
By default you get two states: TODO and DONE. The following will make five states, 
the first three will be shown in red, the last two in green
#+TODO: TODO FEEDBACK VERIFY | DONE CANCELED
*** TODO I need to do this 
     DEADLINE: <2022-08-28 Sun>
...and I should set a deadline
*** This is done
Set =org-log-done= to =time= and see what happens when you are done with an item.

shortcuts:
   C-t toggle through states
   C-d add deadline
   M-up/down on timestamp, increase/decrease year/month/day by one.

** Tags								       :work:
 - Let's tag this 
#+TAGS: work(w) home(h)

shortcuts:
   C-q add a tag, if you have the #+TAGS line you will be able to use abbreviations, here w and h,
   Else you will have to spell out your tag.
** [#7] Priorities
#+PRIORITIES: 1 7 4
 headings may have priorities, default is A,B and C
 
 S-up/down increase/decrease priority

** Links
You may link to web sites [[https://orgmode.org][Org mode]], files [[../ubuntu-trusty-14.04.png][Trusty]], etc.

Set up a link to [[Export]] section below.

** Tables
| target      |          RA |          Dec | Vlsr |
|-------------+-------------+--------------+------|
| Az-lup1-14  | 15:39:09.55 | -33:25:45.69 |  5.0 |
| Az-lup1-10  | 15:42:55.51 | -34:04:31.72 |  5.0 |
| Az-lup1-6   | 15:40:34.77 | -34:40:25.42 |  5.0 |
| Az-lup1-9   | 15:38:31.20 | -35:00:08.78 |  5.0 |
| Az-lup1-11  | 15:45:57.70 | -34:29:43.68 |  5.0 |
| Az-lup1-12  | 15:38:38.38 | -35:02:21.93 |  5.0 |
| Az-lup1-13  | 15:39:27.78 | -35:10:08.22 |  5.0 |
| Az-lup1-15  | 15:45:13.14 | -34:20:30.98 |  5.0 |
| Az-lup1-53  | 15:44:36.09 | -34:21:35.12 |  5.0 |
| Az-lup1-16  | 15:45:18.10 | -34:12:36.79 |  5.0 |
| Az-lup1-17  | 15:42:15.54 | -33:46:15.25 |  5.0 |
| Az-lup1-18  | 15:43:17.48 | -34:04:47.25 |  5.0 |
| Az-lup1-19  | 15:43:54.91 | -34:06:11.59 |  5.0 |
| Az-lup1-73  | 15:42:53.94 | -33:54:01.73 |  5.0 |
| Az-lup1-184 | 15:40:03.11 | -34:41:33.93 |  5.0 |
| Az-lup1-40  | 15:40:46.65 | -33:43:17.88 |  5.0 |
| Az-lup1-72  | 15:38:46.93 | -33:23:36.38 |  5.0 |
| Az-lup1-213 | 15:39:24.88 | -34:24:29.12 |  5.0 |
| Az-lup1-240 | 15:42:42.63 | -34:10:31.28 |  5.0 |
| Az-lup1-244 | 15:40:14.04 | -34:36:23.21 |  5.0 |
| Az-lup1-254 | 15:43:08.55 | -34:03:53.07 |  5.0 |
| Merin11     | 15:43:02.29 |  -34:44:06.2 |  5.0 |
| GWLup       |  15:46:44.6 | -34:30:35.64 |  5.0 |
| Sz65        | 15:39:27.78 |  -34:46:17.4 |  5.0 |
| J154506     |  15:45:06.2 | -34:17:38.04 |  5.0 |
| GQLup       |  15:49:12.2 | -35:39:03.96 |  5.0 |
| Sz66        |  15:39:28.3 |  -34:46:18.3 |  5.0 |
| Sz73        |  15:47:56.9 |  -35:14:34.7 |  5.0 |

shortcuts:
   Mark a region and use C-| to translate comma or tab separated data.
   M-up/down/righ/left reorder rows/columns
   M-S-right insert new empty column
   M-S-left delete column
   TAB will re-align things if needed
   |- on a line by itself will enter a separator line when you hit TAB,
   see second line in table above

** Code snippets
Configure =org-confirm-babel-evaluate= to control prompt.

shortcuts:
   C-c to execute the code snippet. Something I didn't show, when you hit C-c ' 
   emacs will open an extra buffer for the code snippet in the proper mode.

#+BEGIN_SRC shell
ls *.org
#+END_SRC

#+RESULTS:
: orgmode.org

Python code needs to have =:results output= added to see output from print statements.

#+BEGIN_SRC python :results output
  import math

  def myfun(x):
      return 2*x

  x = math.pi
  y = math.cos(x)
  print x, y
#+END_SRC

#+RESULTS:
: 3.14159265359 -1.0

Example producing a file

#+BEGIN_SRC mscgen :file mydiagram.png
msc {
# hscale="1.5";

ScpiRequest,SEPIA,controller;
 |||;
--- [label="APECS query arrives"];
ScpiRequest<=SEPIA [label="property(key, cmd)"];

--- [label="APECS query done"];
 |||;

--- [label="APECS update request arrives"];
ScpiRequest=>SEPIA [label="updateProperty(key, value)"];

--- [label="APECS update request done"];
 |||;

--- [label="APECS tune request arrives"];

ScpiRequest->SEPIA [label="startExec"];
SEPIA->controller [label="tuningRequest(f)"];
controller=>controller [label="tuneLO(f)"];
# controller note controller [label="a note\nanother line\nsecond line"];
controller->SEPIA [label="LOtuned(ok)"];
controller=>controller [label="tuneMixer(POL0)"];
controller->SEPIA [label="mixerTuned(POL0, ok)"];
controller=>controller [label="tuneMixer(POL1)"];
controller->SEPIA [label="mixerTuned(POL1, ok)"];
controller->SEPIA [label="systemTuned(bool)"];
SEPIA=>ScpiRequest [label="tuningFinished.wakeAll()"];

--- [label="APECS tune request done"];

}
#+END_SRC

#+RESULTS:
[[file:mydiagram.png]]

** Export
Fine tune parts of the exported document via meta data

#+TITLE: A short introduction to Org-mode
#+AUTHOR: Karl Jansky
#+EMAIL:  michael.olberg@chalmers.se
#+OPTIONS: toc:nil
 - to HTML
 - to LaTex (and further to pdf)

shortcuts:
   C-c C-e will take you to a menu of export options.
 
** LaTeX integration
 This is my formula \alpha \rightarrow \beta
```

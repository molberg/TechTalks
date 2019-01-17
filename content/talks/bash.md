Date: 2019-01-09
Title: Some useful bash tools
Tags: bash, parallelisation
Author: Franz Kirsten

 * Sometimes it is quicker to write a short bash script to 'get the job done' instead
   of doing it in python or something else
 * bash comes with a load of very useful little programmes that allow you to modify
   files on the fly
 * if you 'pipe' things together (with the `|` operator), i.e. send the output of one
   programme as input to the
   next, you can create a complex chain of task as a one-liner
 * the phylosophy behind the bash-tools is that they are designed to perform only one
   task -- but that task they perform with great performance!
 * bash syntax can be annoying/confusing/frustrating, but you'll get the hang of it!
## Some tools I constantly use
 * some of the below tools I use in the script [tex2md.sh]({filename}/docs/tex2md.sh) that
   we discussed during TechTalk -- its aim is
   to convert a table set in tex into Markdown format. 
 * `grep` -- search for patterns in a file. Useful e.g. when debugging someone else's
   programme that throws an error for which you're trying to find the source code. I then
   typcally run grep 'error message' all/files/in/source/code
 * `sed` -- string editor. Extremely useful if you want to modify the same string in a large
   bunch of files.
 * `awk` -- actually a programming language. Extremely powerful to parse text files, do
   computations on the content of those files, modify the files content and/or write the
   results to a new file -- plus much more!
 * `let` -- a utility to create an integer counter if needed, e.g.:
   ```
        b=3
        let b=$b+1 # increments b by one
   ```
 * cut -- parse files column wise
 * paste -- merge files line by line (i.e. combine two files as columns
 * dd -- convert and copy files. I typically use it to cut large files into smaller ones
 * seq --creates a sequence of numbers. This list of numbers can increase/decrease by a
   user defined step size, output can be padded with zeros, and more
  

## Parallelisation
There is 'real' parallelisation with a tool called `mpibash`, but for most bash-related
tasks it's overkill. I typically parallelise things that are 'embarringly parallel', i.e. I
perform one and the same task over and over again. An example of this would be the
conversion of a bunch of images from, say, png to jpg. The different task are completely
independent of one another and, thus, easy to parallelise. The main idea behind this
is the ability to 'send things to the background' with the `&` operator. Let's say
you have an image called 'sun.png' and you'd like to use `convert` (comes with
ImageMagick) to convet it to 'sun.jpg'. You could just run
```
        convert sun.png sun.jpg
```
While the programme is running you will not be able to do anything else because the
prompt is blocked. If you now append `&` to the command like so:
```
        convert sun.png sun.jpg &
```
the programme will run in the background and you can launch the next job on image sunny.jpg.
```
        convert sun.png sun.jpg & convert sunny.png sunny.jpg &
```
You'll now have two instances of convert running in parallel. You could play this game with
100 or 1000 images, but then the different instances will be competing over the CPU-cycles of
your, say, 4-core laptop. They'll all be running at the same time and, in the worst case
scenario, everything might crash because you don't have enough memory (depending on the size
of the images each instance might take up a lot of RAM). For that reason you might be better off
having at most as many instances running as you have CPU cores on your machine. For that purpose
we can define a little helper function that we shall call 'pwait':
```
        pwait(){
                while [ `jobs -p | wc -l` -eq $1 ];do
                      sleep 0.33
                done
                }

```
This function counts the number of running jobs in the current shell with the inbuilt
tools `jobs` and `wc`, waits for 0.33 seconds (with `sleep`) in case the user-defined
maximum number of jobs is running and counts again. If one of the jobs is done it will
no longer block the running loop and the next iteration of the loop runs.
Thus we could run `convert` on all .png images in the current
working directory like this:
```
        for image in *.png; do
            convert $image ${image%png}jpg &
            pwait(4)
        done
        wait
```
The last `wait` blocks the prompt until the very last job is done.
The syntax `${image%png}jpg` removes the file ending 'png' and replaces it with 'jpg'.
In case you want to convert only a smaller subset (list) of the images, you can create
the list and run through it in the following manner:
```
        list='image1.png image2.png image3.png image4.png'
        for image in $list;do
            convert $image ${image%png}jpg &
            pwait(4)
        done
        wait            
```


Date: 2018-02-21
Title: Rsync and Cron jobs
Tags: bash, backup, rsync, scp, cronjob
Author: Franz Kirsten

 * The slides I showed are in this [rsync-cronjobs.pdf]({filename}/docs/rsync-cronjobs.pdf)
 * in a nutshell `rsync` is a fancy way to copy data
 * instead of copying everything it will syncronise source and sinc by
   comparing time tags and/or sizes of files
 * can be used like `scp` to sync different machines in a very fast
   and efficient way
 * to do this - or any other job - regularly you may want to set
   things up as a cron job - check out the details in the above pdf
   file


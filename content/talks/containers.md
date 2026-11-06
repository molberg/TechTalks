Date: 2018-02-22
Title: Containers
Tags: containers
Author: Stephen Bourke

## What is a container?
 * It’s a file system image (eg. tar archive) that gets used instead
   of the local file system
 * An application to set things up (eg. singularity, docker)
 * When you run an application via a container that application is
   isolated from the rest of the OS
 * Made possible by Linux kernel features

## What can containers do
 * Separate application from infrastructure
 * Ease / Speed of deployment
 * Archive / Repeatability
 * Application isolation

## Introduction
* 2 ways to think of containers:
    + As an application with all of its dependencies
    + As an OS running alongside the native OS
* A container may be limited in its use of system resources
    + It can be restricted to a subset of cores/memory

## Implementations
 * Singularity
    * HPC Science & Engineering
    * Containers used like any other application containers
    * Native network comms
    * Supported by many HPC centres
  * Docker
    * PaaS / Micro Services
    * Daemon runs an manages containers
    * NAT
    * Run on your own [cloud] resources

### Singularity
  * You need admin right to create containers (mostly)
    * Do this on your own machine
  * Copy container image to remote host
  * Run container as a normal user

### Singularity commands
 * build (--sandbox)
    * Can put build specs in a text file
 * exec (--writable)
 * run
    * shortcut for most useful command in the container (defaults to bash)

### Example
If you *really* need `gvim` on `hebbe` (machine at Chalmers C3SE)

> sudo singularity build gvim recipe.gvim
> scp gvim hebbe:
> ssh hebbe
> ./gvim

**Hooray!**

### Real world examples
> sudo singularity build --sandbox ubuntu/ docker://kernsuite/base
> sudo singularity exec --writable ubuntu/ bash

... do stuff ...

> sudo singularity build ubuntu.simg ubuntu/

## Summary review
 * A Container Image:
    * A file system that will be used as / (i.e. root directory)
 * A Running Container:
    * An application running with the image as its file system
 * The Container Image (file system) can be very minimal
    * just the application, its libraries and a few low level files
 * More common is that it will contain a base OS distribution
    * This is just because it’s an easy way of making container images
    * Most of that stuff isn’t needed
 * Linux kernel can isolate the container for rest of the OS
    * This is the default in docker
    * *instance* commands in Singularity
    * Multiple applications can be run in the same container
 * A typical linux filesystem
 * Optionally some extra bits for convenience
    * *run* script, *exec* script, *environment* file, meta data file (Creator, date, etc)
 * Default format is squashfs
    * Can be a plain directory structure
    * Can export an Image as a tar file
 * You can also import a tar file as a container
    * But you don’t really have to
    * Can just untar and use the directory as the container image
 * Upload to singularity-hub or docker-hub
    * Run them on future versions of linux and reproduce results
    * Linux (the kernel) takes backwards compatibility very seriously
    * (If singularity, singularity-hub is still around :-P )
 * Very straigh forward and versatile
 * Any idea I try seems to work
 * GPU acceleration is a exception
    * Often possible but a bit messy
    * You’re stuck with the host systems kernel module
    * Nvidia do not maintain backwards compatibility

The slides are in this [pdf]({static}/docs/sbourke_containers.pdf)

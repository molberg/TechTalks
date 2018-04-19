Date: 2018-04-16
Title: Writing R extensions
Author: Michael Olberg
Tags: R Fortran RADEX

## Overview
  * R makes it easy to use legacy C and Fortran code
  * comes with beautiful graphics and powerful statistical tools
  * > 10000 packages on [CRAN](https://cran.r-project.org/)
  * packages follow high standards for documentation
  * think of R as python with built-in matplotlib and pandas

Take this simple Fortran subroutine:

```
      subroutine facto(n, answer)
C simple routine to compute factorial
C return result by reference in variable answer
      integer n, answer, i

      answer = 1
      do 100 i = 2,n
         answer = answer * i
 100  continue
      end
```

Build a shared library:

```
$ R CMD SHARED facto.f
$ ls
facto.f facto.o facto.so
```

We can now use this R-interface to call our routine:

```
dyn.load("facto.so")
facto <- function(n) {
  foo <- .Fortran("facto", n=as.integer(n), answer=integer(1))
  # returns a list with components n and answer
  foo$answer
}
m <- facto(5)
print(m)
```

or if you would hide this in a package called `facto`:

```
library(facto)
m <- facto(5)
print(m)
```

## Example: RADEX

During the tech talk I'll be demonstrating how to build an R-interface
to RADEX, a publically available Fortran code for radiative
transfer. The legacy code is
[here](http://home.strw.leidenuniv.nl/~moldata/radex.html).

 Idea:

  * replace main function with R wrapper
  * remove all I/O from original program
  * provide input via R variables
  * return result as an R data frame

 Extra:

  * use R routines for warnings, errors, debug statements
  * optional: replace linear algebra code with R built-in routines
  * turn into R package
  * add an interface to read a molecular data file needed by RADEX,
    returning e.g. the molecular levels and transitions as R data
    frames.

The final package is available on [github](https://github.com/molberg/rradex)

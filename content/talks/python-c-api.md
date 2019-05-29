Date: 2019-04-03
Title: The Python C-API
Tags: python, C, C++, API
Author: Michael Olberg

## Extending the Python Interpreter with C/C++

The Python interpreter can be extended via C (or C++) code to

  1. make existing python code execute faster by replacing critical
     sections into compiled code
  2. interface to existing/legacy C (or C++) libraries
  3. make C structures (C++ classes) first class objects within python

In my work I was guided by the following documentation (Python 3.0):
[extending and embedding the Python interpreter](https://docs.python.org/3.0/extending/)

In my demonstration I'll be using an interface I wrote to the CLASSIC
data format (used by CLASS/GILDAS), please ask me for the source code
if you are interested.

To start with I wrote some C++ classes which implement a reader class
for the two types of CLASSIC files, V1 or V2. My C++ code allows to
open a file, determine the file type and return a reader which will
allow to retrieve the header, data vector or frequency vector for a
given id, which ranges from 1 to the number returned by the
`getDirectory` method. Example below is for the V2 reader class:

```
/**
 * A class to read a CLASSIC file of type 2.
 *
 */
class Type2Reader : public ClassReader {

 public:
    Type2Reader(const char *);
    ~Type2Reader();

    int getDirectory();
    SpectrumHeader getHead(int scan);
    std::vector<double> getFreq(int scan);
    std::vector<double> getData(int scan);

 private:
    void getFileDescriptor();
    void getEntry(int k);

    FileDescriptor2 fdesc;
    Type2Entry centry;
    ClassSection2 csect;
    long int ext[MAXEXT];
};
```

In my Python code I wanted to be able to use code like the following:

```
import sys
import pandas as pd
import numpy as np

import classic  # my python module!

print(classic.version())

if len(sys.argv) == 1:
    print("usage: %s <filename>" % (sys.argv[0]))
    sys.exit(1)

classfile = sys.argv[1]
foo = classic.Reader(classfile)

# get number of spectra in file
nscans = foo.getDirectory()
print("number of spectra = %d (%d)" % (nscans, foo.count))

headers = []
for i in range(nscans):
    headers.append(foo.getHead(i+1))

df = pd.DataFrame(headers)

iscan = 1
if len(sys.argv) > 2:
    iscan = int(sys.argv[2])

freq = foo.getFreq(iscan)
data = foo.getData(iscan)
nchan = len(freq)
for i in range(nchan):
	print("%10.5f %10.5f" % (freq[i], data[i]))
```

All code is available at [this git repository](http://skjold.oso.chalmers.se:3000/molberg/CLASSIC.git).

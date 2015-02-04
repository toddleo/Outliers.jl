Outliers.jl
===========
An outlier discovering package for Julia.

At this stage, a naive outlier discovering for numerical vectors is implemented, using the *[BoxPlot Rules](http://www.stat.wmich.edu/s160/book/node8.html)*.

This package will be extended for more functionalities in the future.

## Outliers and BoxPlot Rules

This method works with 1 dimensional numerical vectors. Suppose we have a random vector of float numbers, then manually append a relatively big number at the end, and we want to find out the outlier(s) among such vector. This can be done using `outliers` function as following:

```
using Outliers

a = [randn(10), 100.] # Generate 10 random float numbers, and append a relatively large number as "outlier"
o, idc = outliers(a) # returns the outliers, and according indices in vector
```

# A Haskell extraction program

Make a Haskell program that reads another Haskell problem and creates **separate file** for each function, in the orignal file.

The new file should have the name of the function.

Lets have `funcs.hs`:

```haskell
inc x = x + 1

double x = x * 2

fact 0 = 0
fact n = n * fact (n - 1)
```

Now, if we run our program:

```
$ runhaskell extract.hs funcs.hs
```

We will have the following result:

```
$ ls
extract.hs funcs.hs inc.hs double.hs fact.hs
```

`inc.hs` is:

```haskell
inc x = x + 1
```

`double.hs` is :

```haskell
double x = x * 2
```

`fact.hs` is:

```haskell
fact 0 = 0
fact n = n * fact (n - 1)
```

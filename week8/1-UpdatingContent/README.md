## Stack
### Preparation
 1. Go to https://github.com/commercialhaskell/stack
 2. Install stack on your working path

## Updating Content

As a fellow Haskellers, we want to know how to develop a game in Haskell.

There is a pretty good book covering Haskell Game Programming, but, sadly, it is not finished yet.

The good thing is, that there are some chapters written and available.

You can see [here](https://leanpub.com/gameinhaskell), that there is a note: `Note: this book is in progress` and that current chapters are in the section `Table of Contents`.

We will want to know when the book will be completed and if there are any new chapters since our last visit, so:

##### Write a program, which is doing that for us

#### Notes: 
* There will be a file `last-toc` or something like that in which you will store the information from the last visit. For the first time (or if you've deleted the file) of course, it will not be present, so you'll have to manage that case too.
* Think carefully about the easiest ways to get the contents we want and to store the information we get.

### Some guidelines:
* Remember to setup cabal first:
```
cabal sandbox init
cabal init
cabal install
cabal build
```
Of course, before `cabal install` you should change the dependencies in the `.cabal` file

* For debugging, you should use `cabal repl`. It will load all needed modules. Just working with `ghci` or `runhaskell` won't work, because they will look for the libraries in the global ghc directory, while `cabal repl` looks in the sandbox too.

* Try writing the task on your own before looking at the solution.

### Hints:
* Your first task is to get the content of the page.
* Then inspect it carefully and think about the possible ways to get only the content that is important for us.

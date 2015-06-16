# The course is finally starting!


### Notes on discipline
* Don't miss a class
* Come on time
* Friendly advice: Write some code at home too, else it will become hard to keep pace

## What is functional programming?
* Programming paradigm
* Evolved from lamda calculus
* Computation is the evaluation of mathematical functions
* Avoid changing state and mutable data
* First-class and higher-order functions
* Recursion
* Not only in languages specifically designed for functional programming, anymore

## Haskell
* The result of a research
* Pure functional language (immutable and persistent values)
* Non-strict by default (there is no need to evaluate arguments before they are needed, which allows lazy evaluation)
* Strongly typed (everything has it's type and there are no casts)
* Statically typed (does type checks at compile time)
* Can be both compiled and interpreted

## GHC and GHCi
* Glasgow/Glorious Haskell Compiler
* "... the de facto standard compiler if you want fast code..." (haskell.org)
* GHCi - interaction environment

## Setting up
[Notes on setting up](../Setup/README.md)

## Haskell's basics
* (Some) Types: Int, Integer, Float, Double, Bool, Char, String, Tuples
* Operators and expressions: `+ - / ^ (mod and div)`
* What does a function definition look like?
* `if then else`
* `let` in GHCi

## Time to play!
* `:l` and `:r` in GHCi

## [Tasks](tasks/README.md#01-even)

## Back to basics!
* Type signatures (and using `:t` in GHCi)
* Lists (maybe the most used data structure in functional programming)
* Basic pattern matching
* Basic recursion on lists
* Guards
* `where`

## [More tasks](tasks/README.md#11-type-signatures)

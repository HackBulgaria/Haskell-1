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
```haskell
myFunction arg1 arg2 ... = doing something with the arguments
```
* `if then else`
```haskell
evenOrOdd x = if even x then "even" else "odd"
```
* `let` in GHCi
```haskell
let x = 42
let f x = x + 42
```

## Time to play!
* `:l` and `:r` in GHCi (:load and :reload)

## [Tasks](tasks/README.md#01-even)

## Back to basics!
* Type signatures (and using `:t` in GHCi (:type))
```haskell
function :: Type1 -> Type2 -> ... -> TypeN

evenOrOdd :: Integer -> String
evenOrOdd x = if even x then "even" else "odd"
```
* Lists (maybe the most used data structure in functional programming)
```haskell
let sevenFibs = [0, 1, 1, 2, 3, 5, 8]
```
* Basic pattern matching
```haskell
tellMeWhats :: String -> Integer
tellMeWhats "the meaning of life" = 42
tellMeWhats _                     = error "I haven't the slightest idea."

tail' (_:xs) = xs
tail' _      = error "The empty list has no tail.."
```
* Basic recursion on lists
```haskell
last' [x]    = x
last' (_:xs) = last' xs
last' _      = error "The empty list has no elements.."
```
* Guards
```haskell
evenOrOdd :: Integer -> String
evenOrOdd x | even x    = "even"
            | otherwise = "odd"
```
* `where`
```haskell
triangleArea :: Double -> Double -> Double -> Double
triangleArea a b c = sqrt (p * (p - a) * (p - b) * (p - c))
  where p = (a + b + c) / 2
```

## [More tasks](tasks/README.md#11-type-signatures)

## Hoogle
* [Hoogle](https://www.haskell.org/hoogle/) is the Haskell API search engine
### Why is it so good?
* searching by function names
* searching by function type signatures

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

## [Tasks](1-Beginner-Tasks/README.md#01-even)

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

## [More tasks](1-Beginner-Tasks/README.md#11-type-signatures)

## Hoogle
* [Hoogle](https://www.haskell.org/hoogle/) is the Haskell API search engine

### Why is it so good?
* Searching by function names
* Searching by function type signatures

## More types and introduction to typeclasses
* Again, the Haskell's type system is strong and static 
* We know some types and we've already met some typeclasses! (try `:t (+)`)
```
What a type system gives us is abstraction.
```
* Type synonyms
```haskell
-- What does the following function do?
getAddress :: Integer -> String

-- Let's rewrite it a bit..
type ID      = Integer
type Address = String

-- Is it more clear now?
getAddress :: ID -> Address
```
* Type variables and polymorphic functions
* Type inference in Haskell
* Why do we need typeclasses?
```
Typeclasses gives us the benefits of dynamic typing in a safer form.
```
* Class constraints
* Some basic classes are: `Num, Eq, Ord, Read, Show, Enum, Bounded, Integral, Floating` (`:i` (:info))
* Later on we will see how to define our own typeclasses!

## How can we move between decimals and floats when we don't have a cast?
* `fromIntegral :: (Integral a, Num b) => a -> b`
* `truncate, round, ceiling, floor :: (Real a, Fractional a, Integral b) => a -> b`

## Let us continue our journey with lists!
* `["I", "am", "a", "list"]
* (++) :: [a] -> [a] -> [a]
* Ranges - `[1..10]`
* More recursion over lists
* List comprehensions, the beginning:
```haskell
let tuples = [(x, y) | x <- [1..10], y <- [1..10], x < y]
```

## [Tasks again](1-Beginner-Tasks/README.md#27-is-valid-id)

## Higher-order functions!
* Taking functions as arguments
```haskell
isTrueForTuple :: (Int -> Bool) -> (Int, Int) -> Bool
isTrueForTuple pred (x, y) = pred x && pred y

evenTuple :: (Int, Int) -> Bool
evenTuple tuple = isTrueForTuple even tuple
```
* lamda functions' syntax
```haskell
\arg1 arg2 -> do something with arg1 and arg2

transformTuple :: (a -> b) -> (a, a) -> (b, b)
transformTuple f (x, y) = (f x, f y)

doubleTuple tuple = transformTuple (\x -> x * 2) tuple
```
Indeed, everything desugars to lamda functions at some time.
```haskell
concatenate (x:xs) ys = x : concatenate xs ys
concatenate _      ys = ys

concatenate = \xs ys -> if null xs then ys else head xs : concat (tail xs) ys
```
* Returning functions
```haskell
f :: Num a => a -> (a -> a)
f x = \y -> x * y
```
* Sections (it's only syntactic sugar)
```haskell
f = (^42)
f = \x -> x ^ 42
f x = x ^ 42

g = (`div` 42)
g = \x -> x `div` 42
g x = x `div` 42

h = (42 `div`)
h = \x -> 42 `div` x
h x = 42 `div` x

doubleTuple tuple = transformTuple (*2) tuple
```
* maps (applyToAll), filters (filterBy), folds (foldl and foldr <-> reduce and reduce')

## [The last tasks for this week](1-Beginner-Tasks/README.md#38-return-a-function-which-multiplies-a-number-by-a-factor)

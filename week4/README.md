# Functional programming - week 4

[Day 1](./README.md#day-1)

[Day 2](./README.md#day-2)
 
## Day 1

### Typeclasses
* the `class` keyword
```haskell
type Sound = String

class Instrument i where
  play :: i -> Sound
```

##### now what can we do with that?

* defining behaviour:
```
"You can think of them kind of as Java interfaces, only better."
*Learn You A Haskell*
```

* making instances
```haskell
data Drum = HiHat
          | Snare
          | Bass
  deriving (Show, Read, Eq)

sound :: Drum -> Sound
sound HiHat = "ts"
sound Snare = "kh"
sound Bass  = "bm"

instance Instrument Drum where
  play drum = sound drum
```
* default implementations
```haskell
class Instrument i where
  play :: i -> Sound
  play = const "bzz"
```
### Newtypes
* one more keyword - `newtype`
```haskell
newtype Sums = Sums { a :: getSum } deriving (Show, Read, Eq)
```
* it performs better than `data`, but only one value constructor and one value field are possible

## [Typeclasses task](./5-TypeClasses/README.md#01-the-dionom)


## Day 2

### IO in Haskell

Haskell is a pure functional language. We have pure functions with no side effects.

IO is a side-effect by nature.

So it is interesting how we can handle that.

[A good way to see more about Input and Output in Haskell is to read that chapter](http://learnyouahaskell.com/input-and-output)

#### Hello World in Haskell

Here is the [`hello.hs`](./hello.hs) program:

```haskell
main = putStrLn "Hello World"
```

We can run the program with the `runhaskell` command:

```
$ runhaskell hello.hs
Hello World
```

The `main` function is the function that ghc calls to start our Haskell program.

Lets check the type of our `main` function in ghci:


```
Prelude> :l hello.hs
Prelude> :t main
main :: IO ()
```

It is an empty IO operation.

IO is a special type, that wraps data, that comes from input or goes to the output. This is Haskell's way of dealing with side effects & impure data.

**Everything that touches IO, must become IO!**

Lets check the type of `putStrLn` in ghci:

```
Prelude> :t putStrLn
putStrLn :: String -> IO()
```

Again, we take a String and we return an empty IO operation.

#### Printing

There are two general functions, that we are going to use to output something to the console:

* `putStrLn :: String -> IO ()`
* `print :: Show a => a -> IO()`

As you can see, `print` is more convinient, because it takes something, that can be showed. Sweet.

#### Do notation

We want our `main` function to behave like a normal procedural function - to do a sequence of reads and writes, taking the result wherever we need that.

The `do` notation has the following syntax:

```haskell
main = do
  print 5
  print [1, 2, 3]
  putStrLn "Hello World"
```

This will execute the functions in the order we have called them. Sweet.

#### Reading from the input

Now, let's take some input from our user.

For that, we have the function `getLine :: IO String`.

First, lets see an example in [`read.hs`](./read.hs):

```haskell
main = do
  name <- getLine
  putStrLn $ concat ["Hello ", name]
```

and:

```
$ runhaskell read.hs
Rado
Hello Rado
```

Now, there are few things that are happening right now:

* The type `IO String` is interesting
* There is a new operator - the `<-`

`IO String` means **tainted data**. Something impure is about to happen. That's why Haskell wraps the `String` within `IO`

**In Haskell, there is no sane way to have the following function:**

```
somethingUnsafe :: IO String -> String
```

The magic happens thanks to the `<-` operator.

You can read it as **unboxing** the pure value from impure operation. This will extract the `String` from `IO String`. But there is a cost. You can only extract the `String` to give it to a pure function.

But the function that uses `IO String` **must** return something from the `IO` type. We cannot escape.

#### A small program

Lets have a program that reads one integer and prints the prime factorization of that integer:

```haskell
times :: Int -> Int -> Int
times x y
    | rem x y == 0 = 1 + times (div x y) y
    | otherwise    = 0

isPrime :: Int -> Bool
isPrime x = [x] == [ y | y <- [2..x], rem x y == 0]

primeFactorization :: Int -> [(Int, Int)]
primeFactorization x = [ (y, times x y) | y <- [2..x], isPrime y, rem x y == 0]

main = do
  rawN <- getLine
  let n = read rawN
  print $ primeFactorization n
```

We have a new part - `let n = read rawN`

Now, we have two things to consider in our main:

* The `<-` operator takes the pure value from an `IO` operation
* `let` with `=` can create new pure value from another pure value. You cannot take value from `IO` operation.

This is it. Now we have the basic stuff.

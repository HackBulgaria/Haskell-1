# Functional programming - week 5

[Day 1](./README.md#day-1)

[Day 2](./README.md#day-2)
 
## Day 1

### Web Haskell

#### Stackage

It is an index of mutually stable library versions in [Hackage](http://hackage.haskell.org/). 
It is created automatically with building and testing different version of libraries from [Hackage](http://hackage.haskell.org/) on many operating systems. 
Index description is kept in a single file [cabal.config](https://www.stackage.org/lts/cabal.config) which should be put along with cabal file in same folder.

#### DSL

DSL = Domain Specific Language
They are used to constrain operations to certain well defined and tested set. DSLs are usually easier to read and modify even by non-programmers. They are easier to test and proof, because of the constrained domain.
In Haskell it is easy to make DSL and they are widely used.

#### TemplateHaskell, QuasiQuotations and ChichkoviteChervenotikvenovcheta

[QuasiQuotations](https://wiki.haskell.org/Quasiquotation) - a GHC extension for embedding DSLs (EDSL) inside Haskell code
[TemplateHaskell](https://wiki.haskell.org/Template_Haskell) - a GHC extension for type-safe compile-time meta programming
ChichkoviteChervenotikvenovcheta - extension for testing your speak skills

#### Shakespearean templates

[They](http://www.yesodweb.com/book/shakespearean-templates) are type-safe EDSL for HTML, CSS and JavaScript description. Coming from Yesod framework.

#### FP Complete

Cloud based IDE for Haskell - [www.fpcomplete.com](https://www.fpcomplete.com)

#### Simple example

```haskell
{-# LANGUAGE TypeFamilies, QuasiQuotes, TemplateHaskell, OverloadedStrings #-}
module Main where

import Yesod

data App = App

instance Yesod App

mkYesod "App" [parseRoutes| / HomeR  GET |]

getWorldR = defaultLayout $ [whamlet| <p> Hello World! |]

main :: IO ()
main = warp 3000 App
```

Can also be found here:  https://www.fpcomplete.com/user/varosi/minimalistic-yesod-server

#### cabal install

Note that it could take 15min on Core i7 first time for Yesod libraries to build. And it is good to use GHC >=7.8.x and cabal >= 1.18.

1. wget https://www.stackage.org/lts/cabal.config
2. cabal update
3. cabal sandbox init
4. cabal install

#### Preparation

You'll need your code about fractals image generation.

Search help install:

* [Hoogle](https://www.haskell.org/hoogle/)
* [Hayoo!](http://hayoo.fh-wedel.de)

#### Tasks

1. Make basic example run
2. Modify basic example say "Hey, " and your name answering on /hey/#String
3. Show Mandelbrot fractal on /mandelbrot
4. Pass fractal image size on URL

#### Helping snippet

```haskell
getHelloR :: MonadHandler m => m TypedContent
getHelloR = sendResponse $ toTypedContent (typePlain, toContent "Say Haskell!")
```

"Say Haskell!" string may be changed with anything that is ByteString.

## Day 2

### Some more theory again.. Functors and Applicatives!

#### The `Functor` typeclass

We already encountered some problems when using the Maybe typeclass.

Imagine that situation: Say that we have a function that reads a String and if it is a correct representation of integer we get a `Just` of it, else we get `Nothing`.

We want to have a function, that receives a String that maybe represents an integer, then square it.

```haskell
readNumber :: String -> Maybe Int

square :: String -> Maybe Int
square s = case readNumber s of
           Just x  -> Just $ x ^ 2
           Nothing -> Nothing
```

Hmm, okay, not really that bad. But should we do this `Maybe` wrapping and unwrapping everytime by hand? Isn't it possible, to write such a function, that it can do this for us?

```haskell
square :: String -> Maybe Int
square s = magic (^2) $ readNumber s

-- or even
square = magic (^2) . readNumber
```
Yes, that looks more like Haskell, concise, terse code.

We know IO! What if we wanted to do the same thing, but with an IO?

```haskell
getLine :: IO String

readNumber :: String -> Maybe Int

main = do
  n <- getLine
  let n' = readNumber n
  print n'
```

Wouldn't it be better, if we could use some `magic` again, so that:

```haskell
main = do
  n <- magic readNumber getLine
  print n
```

Also, we have already done that wrapping and unwrappind, only with a different type.

Let's get back to lists!

```haskell
data List a = Cons a (List a) | Nil

readNumber :: String -> Maybe Int

stringsToInt :: List String -> List (Maybe Int)
stringsToInt (Cons x xs) = Cons (readNumber x) $ stringsToInt xs
stringsToInt Nil         = Nil
```

Again, let's use our `magic`:

```haskell
stringsToInt xs = magic readNumber xs
```

But wait.. We already have the `magic` function! It's `map`!

Let's see what is the type signature of `map`:
```haskell
map :: (a -> b) -> List a -> List b
```

And what would be the signatures of our magic functions above:
```haskell
-- magic for Maybe:
magic :: (a -> b) -> Maybe a -> Maybe b

--magic for IO:
magic :: (a -> b) -> IO a -> IO b
```

Hmm.. These type signatures look almost the same if we don't count the `List`, `Maybe` and `IO`

Okay. Let's see what is a `Functor`, indeed. We already said, that it's a typeclass.

```haskell
class Functor f where
  fmap :: (a -> b) -> f a -> f b
```

So, if we replace that `f` with the types above, `fmap` will match exactly our `magic` function.

Let's implement some instances!

```haskell
instance Functor Maybe where
--fmap :: (a -> b) -> Maybe a -> Maybe b
  fmap f (Just x) = Just $ f x
  fmap f Nothing  = Nothing

instance Functor IO where
--fmap :: (a -> b) -> IO a -> IO b
  fmap f (IO a) = IO $ f a

instance Functor List where
--fmap :: (a -> b) -> List a -> List b
  fmap = map
```

How sweet!

`Note: because sometimes it'll be more convenient to use `fmap` infix, there is a synonym for it:

```haskell
infixl 4 <$>

-- | An infix synonym for 'fmap'.
(<$>) :: Functor f => (a -> b) -> f a -> f b
(<$>) = fmap

-- example:
-- > (+1) <$> [1..10]
-- [2..11]
```


So, the `Functor`, as all other typeclasses, gives us an abstraction. All `Functor`s, such as `List`s and `Maybe`s can be `fmap`ed over.

##### Functor Laws

```haskell
fmap id      = id              -- Identity
fmap (f . g) = fmap f . fmap g -- Composition
```

#### The `Applicative`

Okay. For now, the `Functor` typeclass seems pretty rich.
But can we do more things like:

```haskell
> Just (+3) `moreMagic` Just 2
Just 5
```

Let's see what we have in our inventaire:
```
> :t fmap
Num a => Maybe a
> :t Just (+ 3)
Num a => Maybe (a -> a)
```

That's bad. The only way to combine the two functions is by:
```haskell
combine :: Num a => Maybe (a -> a) -> Maybe a -> Maybe a
combine (Just f) x = f <$> x
combine Nothing  _ = Nothing
```

But that's not a behaviour that a `Functor` has. What is it?

It's an `Applicative`, of course!

See what behaviour the `Applicative` typeclass defines:

```haskell
class Functor f => Applicative f where
  (<*>) :: f (a -> b) -> f a -> f b
```

Yee-haw! If we create an instance for `Applicative Maybe`,
we could use the strange-looking `<*>` operator for our purposes.

```haskell
instance Applicative Maybe where
  Just f <*> Just x = Just $ f x
  _      <*> _      = Nohting

--Just f <*> x = f <$> x
```

Okay. I have to mention some things:
* First, in order to make something an instance of `Applicative`, it should be a `Functor` first.
* Second, I lied. That's not really an `Applicative`. Here's the full definition:
```haskell
class Functor f => Applicative f where
  pure  :: a -> f a
  (<*>) :: f (a -> b) -> f a -> f b
```

What is that `pure` function for? Well, it wraps a pure value in a minimal `Applicative` context. We will see later why.

So, for `Applicative Maybe`, the logical `pure` would act as:

```
> pure 2 :: Maybe Int
Just 2
```

##### Applicative Laws

```haskell
pure id <*> v     = v                -- Identity
pure f <*> pure x = pure (f x)       -- Homomorphism
u <*> pure y      = pure ($ y) <*> u -- Interchange
pure (.) <*>
    u <*> v <*> w = u <*> (v <*> w)  -- Composition
```

[Now go write some Haskell!](./2-Applicatives/README.md#01-the-binary-tree-functor)

Some trickies:
* the (->) functor
* the (->) and List applicatives
* more `Applicative`s functions:
```haskell
-- | Sequence actions, discarding the value of the first argument.
(*>) :: f a -> f b -> f b

-- | Sequence actions, discarding the value of the second argument.
(<*) :: f a -> f b -> f a
```

#### The Alternative

```haskell
class Applicative f => Alternative f where
  empty :: f a
  (<|>) :: f a -> f a -> f a

-- A Maybe example:
instance Alternative Maybe where
  empty = Nothing

  Nothing <|> r = r
  l       <|> _ = l
```

[Back to code!](./2-Applicatives/README.md#03-simple-parser)

** Additional materials: **
* [Learn You A Haskell](http://learnyouahaskell.com/functors-applicative-functors-and-monoids)
* [In pictures!](http://adit.io/posts/2013-04-17-functors,_applicatives,_and_monads_in_pictures.html)

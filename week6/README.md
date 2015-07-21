# Functional programming - week 6

[Day 1](./README.md#day-1)

Day 2
 
## Day 1

### Continuing our `Functor` and `Applicative` journey!

#### Let's recall our typeclasses!
* `Functor`
```haskell
class Functor f where
  fmap :: (a -> b) -> f a -> f b

(<$>) :: Functor f => (a -> b) -> f a -> f b
(<$>) = fmap
```
* `Applicative`
```haskell
class Functor f => Applicative f where
  pure  :: a -> f a
  (<*>) :: f (a -> b) -> f a -> f b

  -- These had a default implementation
  (<*) :: f a -> f b -> f a
  (*>) :: f a -> f b -> f b
```
* `Alternative`
```haskell
class Applicative f => Alternative f where
  empty :: f a
  (<|>) :: f a -> f a -> f a
```

So, all these typeclasses give us abstractions.

Now go to the [tasks](./1-Applicatives/README.md#01-an-expression-parser) again!

### Dug a little (tiny) deeper.. Monads!
```haskell
class Monad m where
  return :: a -> m a
  (>>=)  :: m a -> (a -> m b) -> m b

  (>>) :: m a -> m b -> m b
  f >> g = f >>= \_ -> g
```

#### Take a look at some instances:
* The `Maybe` monad
* The `List` monad
* The `IO` monad


** Additional materials: **
* [Learn You A Haskell](http://learnyouahaskell.com/functors-applicative-functors-and-monoids)
* [In pictures!](http://adit.io/posts/2013-04-17-functors,_applicatives,_and_monads_in_pictures.html)

# Functional programming - week 7

[Day 1](./README.md#day-1)

Day 2
 
## Day 1

### `Monad`s!

#### What was a monad?

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

Let's do some [monad work](./1-Monads/README.md#01-instances) now!


#### Do you remember the `Monoid`s?
* `mempty`
* `mappend`

```haskell
class Monoid m where  
  mempty :: m  
  mappend :: m -> m -> m  
  mconcat :: [m] -> m  
  mconcat = foldr mappend mempty  
```

#### The `Writer` monad:

```haskell
newtype Writer w a =
  Writer { runWriter :: (a, w) }
```

`Good. Why we need to know what a `Monoid` is to use that?`

** Because it will be useful to know that there is a way to append several logs in the writer **

[Tasks](./2-Writer/README.md#01-the-writer)


** Additional materials: **
* [Learn You A Haskell](http://learnyouahaskell.com/a-fistful-of-monads)
* [In pictures!](http://adit.io/posts/2013-04-17-functors,_applicatives,_and_monads_in_pictures.html)

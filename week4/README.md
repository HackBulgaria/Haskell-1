# Functional programming - week 4

[Day 1](./README.md#day-1)

Day 2
 
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

### `Monoid`s, `Foldable`s and the `foldMap` function
#### What is a monoid and what are it's uses?
* `Sum`, `Product`, `Any` and `All`
#### Some notes about `Foldable`

```haskell
class Foldable t where
  -- | Map each element of the structure to a monoid,
  -- and combine the results.
  foldMap :: Monoid m => (a -> m) -> t a -> m
```

# Functional programming - week 2
Unfortunately, these week we didn't have day two, because I got ill :/

## Day 1
 
## Notes and thoughts on style, conventions, etc...

### Lists
```haskell
-- You will shadow the functions head and tail
take' n (head:tail) = undefined

-- Later, we will use h for functions and t for some types and it will get confused
take' n (h:t) = undefined

-- In most Haskell libraries you will see this:
take' n (x:xs) = undefined
-- Or as, bs, cs, ds..
-- It's only a convention, but it helps readability
```

### To guard or not to guard?

#### When you have an equality comparison use a pattern match
```haskell
-- Match, match, match!
last' [x]    = x
last' (_:xs) = last' xs
-- We can also write last' _  ... here
last' []     = error "The empty list has no last element!"

-- To guard
fib x = helper 0 1 0
  where helper n m i | i == x    = n
                     | otherwise = helper m (n + m) (i + 1)

-- Combination of both
nth n (_:xs) | n > 0 = nth (n - 1) xs
nth 0 (x:_) = x
-- Why didn't we write nth _ [] ?
nth _ _     = error "Invalid index!"
```

#### Common mistakes
```haskell
-- You can't pattern match like that!
member x (x:xs) = True
member x (_:xs) = member x xs
member _ _      = False

-- It should be:
member elem (x:xs) | elem == x = True
                   | otherwise = member elem xs
member _    _ = False

-- Even better:
member elem (x:xs) = elem == x || member elem xs
member _    _      = False


-- That's awful :/
sum' xs = if xs /= [] then head xs + sum' (tail xs) else 0

-- Should be:
sum' (x:xs) = x + sum' xs
sum' _     = 0

-- It's even incorrect here:
concatenate xs ys = if xs == [] then ys else head xs : concatenate (tail xs) ys
-- Can you spot it? Try `:t concatenate` in ghci..

-- A little better:
concatenate xs ys = if null xs then ys else head xs : concatenate (tail xs) ys

-- But why not:
concatenate (x:xs) ys = x : concatenate xs ys
concatenate _      ys = ys


-- This is common too:
head' (x:_) = x
-- Try to call head' [] in ghci

-- Arrange the pattern matches carefully!
init' (_:xs) = init' xs
init' [_]    = []
init' _      = error "You can't do that on the empty list!"
```

* Add this option to your .hs file and you won't miss a pattern

```haskell
{-# OPTIONS_GHC -fwarn-incomplete-patterns #-}
```

### Some notes about recursion and TCO

```haskell
-- Let's solve length with standard recursion
length' (_:xs) = 1 + length' xs
length' _      = 0

-- Now using TCO (it would be faster, weren't there some Haskell's laziness peculiarities)
length'' xs = helper 0 xs
  where helper n (_:xs) = helper (n + 1) xs
        helper n _      = n
```

## Higher-order functions again

### What are the common patterns?
* Higher-order functions that iterate over lists
* On each iteration, we do something depending on the function argument
* They have the same bottom case

### map
```haskell
map :: (a -> b) -> [a] -> [b]
map f (x:xs) = f x : map f xs
map _ _      = []
```

### filter
```haskell
filter :: (a -> Bool) -> [a] -> [a]
filter p (x:xs)
  | p x       = x : filter p xs
  | otherwise = filter p xs
filter _ _      = []
```

### foldl
```haskell
foldl :: (a -> b -> a) -> a -> [b] -> a
foldl f acc (x:xs) = foldl f (f acc x) xs
foldl _ _   _  = []
```

## Infinite lists
```haskell
[1..]
take 100 [1..] -> [1..100]
```

## Function application and function composition
* ($)
* (.)
* Can you guess the types?

```haskell
-- ($) :: (a -> b) -> a -> b
f x <-> f $ x
f (x + 1) <-> f $ x + 1
f (g x) <-> f $ g x

-- (.) :: (b -> c) -> (a -> b) -> (a -> c)
(\x -> x `mod` 2 == 0) <-> (== 0) . (`mod` 2)
map (^2) $ map (*2) [1..10] <-> map ((^2) . (*2)) [1..10]
```

#### And don't forget the section!
## [Code golf!](2-CodeGolfing/README.md#01-map-as-foldl?)
```
..strive to achieve the shortest possible code that
implements a certain algorithm..
```
Note: Use what's already written! (if you don't know, ask Hoogle)

`map, filter, fold, fst, snd, reverse, length, zip, cycle...`

## Monads

### 01 Instances
#### Make a monad instances for the following types:
* `Maybe`
* `List`
* `(->)`

### 01. join

```haskell
join :: Monad m => m (m a) -> m a
```
```
join (Just (Just 2))     -> Just 2
join [[1, 2, 3], [2, 3]] -> [1, 2, 3, 2, 3]
join (+) 21              -> 42
```

### 02. sequenceM

```haskell
sequenceM :: Monad m => [m a] -> m [a]
```
```
sequenceM [Just 2, Just 3] -> Just [2, 3]
sequenceM [[1, 2], [1]]    -> [[1, 1], [2, 1]]
sequenceM [(+1), (+2)] 4   -> [5, 6]
```

### 02. replicateM

```haskell
replicateM :: Monad m => Int -> m a -> m [a]
```
```
replicateM 4 (Just 3) -> Just [3, 3, 3, 3]
replicateM 2 [1, 2]   -> [[1, 1], [1, 2], [2, 1], [2, 2]]
replicateM 2 (+2) 3   -> [5, 5]
```

### 03. filterM

```haskell
filterM :: Monad m => (a -> m Bool) -> [a] -> m [a]
```
```
filterM (Just . even) [1, 2, 3]      -> Just [2]
filterM (const [True, True]) [1, 2] -> [[1, 2], [1, 2], [1, 2], [1, 2]]
filterM (>) [1..10] 8                -> [9, 10] 
```

### 04. mapM

```haskell
mapMM :: Monad m => (a -> m b) -> [a] -> m [b]
```
```
mapMM (Just . (^2)) [1, 2, 3]     -> Just [1, 4, 9]
mapMM (const [True, True]) [1, 2] -> [[True, True], [True, True], [True, True], [True, True]]
mapMM (+) [1, 2] 3                -> [4, 5]
```

### 04. foldM

```haskell
foldM :: Monad m => (a -> b ->  m a) -> a -> [b] ->  m a
```
```
foldM (\x y -> Just $ x + y)  [1..9]     -> Just 45
```

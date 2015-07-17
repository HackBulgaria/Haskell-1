module IntList where


data IntList a = Cons a (IntList a) | Empty
    deriving (Show)

fromList :: [a] -> (IntList a)
fromList (x:xs) = Cons x (fromList xs)
fromList []     = Empty

toList :: (IntList a) -> [a]
toList (Cons x rest) = x : toList rest
toList Empty         = []

mapIntList :: (a -> a) -> (IntList a) -> (IntList a)
mapIntList f (Cons x rest) = Cons (f x) (mapIntList f rest)
mapIntList f Empty         = Empty

filterIntList :: (a -> Bool) -> (IntList a) -> (IntList a)
filterIntList f (Cons x rest) =
  if f x then Cons x (filterIntList f rest) else filterIntList f rest 
filterIntList f Empty = Empty

foldIntList :: (a -> a -> a) -> a -> (IntList a) -> a
foldIntList f s (Cons x xs) = foldIntList f (f s x) xs
foldIntList f s Empty       = s

module List where


data List a = Cons a (List a) | Empty

-- This one's a bonus
instance Show a => Show (List a) where
  show = show . toList

fromList :: [a] -> List a
fromList (x:xs) = Cons x $ fromList xs
fromList _      = Empty

toList :: List a -> [a]
toList (Cons x xs) = x : toList xs
toList _           = []

append :: List a -> List a -> List a
append (Cons x xs) ys = Cons x (append xs ys)
append _           ys = ys

mapList :: (a -> b) -> List a -> List b
mapList f (Cons x xs) = Cons (f x) $ mapList f xs
mapList _ _           = Empty

filterList :: (a -> Bool) -> List a -> List a
filterList p (Cons x xs) = if p x
  then Cons x $ filterList p xs
  else filterList p xs

foldlList :: (a -> b -> a) -> a -> List b -> a
foldlList f z (Cons x xs) = foldlList f (f z x) xs

foldrList :: (a -> b -> b) -> b -> List a -> b
foldrList f z (Cons x xs) = f x $ foldrList f z xs
foldrList _ z _           = z

type IntList = List Int

concat' :: [[a]] -> [a]
concat' = foldr (\x acc -> foldr (\x acc1 -> x : acc1) acc x) []

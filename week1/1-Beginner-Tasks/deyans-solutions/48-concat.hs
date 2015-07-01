concat' :: [[a]] -> [a]
concat' = foldr (\x acc -> x ++ acc) []

filter' :: (a -> Bool) -> [a] -> [a]
filter' p = foldl (\acc x -> if p x then acc ++ [x] else acc) []

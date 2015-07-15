cycle' :: [a] -> [a]
cycle' [] = error "You passed the empty list to cycle'"
cycle' xs = xs ++ cycle' xs

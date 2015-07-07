filterBy :: (a -> Bool) -> [a] -> [a]
filterBy p (x:xs) = if p x then x : filterBy p xs else filterBy p xs
filterBy _ _      = []

filterFilter :: (a -> Bool) -> [[a]] -> [[a]]
filterFilter p = map (filter p)

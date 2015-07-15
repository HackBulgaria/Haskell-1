mapMap :: (a -> b) -> [[a]] -> [[b]]
mapMap f = map (map f)

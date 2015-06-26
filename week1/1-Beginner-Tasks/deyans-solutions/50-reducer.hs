reducer :: (a -> b -> b) -> b -> [a] -> b
reducer f acc xs@(x:_) = reducer f (f (last xs) acc) (init xs)
reducer _ acc _ = acc

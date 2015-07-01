reducer :: (a -> b -> b) -> b -> [a] -> b
reducer f acc (x:xs) = f x (reducer f acc xs)
reducer _ acc _ = acc

odds :: Integral a => [a] -> [a]
odds (x:xs) | odd x     = x : odds xs
            | otherwise = odds xs
odds _ = []

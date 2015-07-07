take' :: Int -> [a] -> [a]
take' n (x:xs) | n > 0 = x : take' (n - 1) xs
take' _ _              = []

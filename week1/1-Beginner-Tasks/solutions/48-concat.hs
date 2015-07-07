concat' :: [[a]] -> [a]
concat' (x:xs) = x ++ concat' xs
concat' _      = []

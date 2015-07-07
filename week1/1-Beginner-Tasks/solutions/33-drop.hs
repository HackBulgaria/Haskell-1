drop' :: Int -> [a] -> [a]
drop' n (_:xs) | n > 0 = drop' (n - 1) xs
drop' _ xs             = xs

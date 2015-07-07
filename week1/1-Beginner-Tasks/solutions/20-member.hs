member :: Eq a => a -> [a] -> Bool
member elem (x:xs) = elem == x || member elem xs
member _    _      = False

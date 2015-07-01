tail' :: [a] -> [a]
tail' (_:xs) = xs
tail' _ = error "Cannot call tail' on empty list"

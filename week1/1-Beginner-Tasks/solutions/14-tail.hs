tail' :: [a] -> [a]
tail' (_:xs) = xs
tail' _      = error "The empty list has no tail!"

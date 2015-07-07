init' :: [a] -> [a]
init' [x]    = []
init' (x:xs) = x : init' xs
init' _      = error "You can't do that on the empty list!"

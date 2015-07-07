last' :: [a] -> a
last' [x]    = x
last' (_:xs) = last' xs
last' []     = error "You cannot call last' on the empty list!"

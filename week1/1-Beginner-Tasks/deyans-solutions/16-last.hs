last' :: [a] -> a
last' [x] = x
last' (_:xs) = last' xs
last' [] = error "Cannot call last' on empty list"

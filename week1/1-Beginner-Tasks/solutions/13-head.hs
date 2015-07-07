head' :: [a] -> a
head' (x:_) = x
head' _     = error "You cannot have the head of the empty list!"

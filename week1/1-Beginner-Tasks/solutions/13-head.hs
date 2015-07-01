head' :: [a] -> a
head' (x:_) = x
head' _ = error "Cannot call head' on empty list"

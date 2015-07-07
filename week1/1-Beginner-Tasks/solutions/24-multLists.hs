multLists :: Num a => [a] -> [a] -> [a]
multLists (x:xs) (y:ys) = x * y : multLists xs ys
multLists _      _      = []

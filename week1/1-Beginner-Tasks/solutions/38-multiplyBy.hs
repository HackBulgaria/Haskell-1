multiplyBy, multiplyBy' :: Int -> (Int -> Int)
multiplyBy y = \x -> x * y

multiplyBy' y = (*y)

isFibonacciSequence :: [Int] -> Bool
isFibonacciSequence (x:zs@(y:z:_)) = x + y == z && isFibonacciSequence zs
isFibonacciSequence _ = True

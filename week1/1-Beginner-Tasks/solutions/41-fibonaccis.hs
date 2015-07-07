fibonaccis :: [Int] -> [Integer]
fibonaccis (x:xs) = fib 0 1 0 : fibonaccis xs
  where fib n m i | i == x    = n
                  | otherwise = fib m (n+m) (i + 1)
fibonaccis _      = []

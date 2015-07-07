lastDigits :: [Int] -> [Int]
lastDigits xs = applyToAll (`mod` 10) xs

stringsToIntegers :: [String] -> [Int]
stringsToIntegers ss = applyToAll read ss

fibonaccis :: [Int] -> [Integer]
fibonaccis xs = applyToAll (fib 0 1 0) xs
  where fib n m i x | i == x    = n
                    | otherwise = fib m (n+m) (i + 1) x

lastDigits :: [Int] -> [Int]
lastDigits (x:xs) = x `mod` 10 : lastDigits xs
lastDigits _      = []

times :: Int -> Int -> Int
times x y
    | rem x y == 0 = 1 + times (div x y) y
    | otherwise    = 0

isPrime :: Int -> Bool
isPrime x = [x] == [y | y <- [2..x], rem x y == 0]

primeFactorization :: Int -> [(Int, Int)]
primeFactorization x = [(y, times x y) | y <- [2..x], isPrime y, rem x y == 0]

main = do
  rawN <- getLine
  let n = read rawN
  print $ primeFactorization n

unit, unit' :: Int -> Int -> [[Int]]
unit e n = map (\x -> map (\y -> if x == y then e else 0) [1..n]) [1..n]

unit' e n = [[if x == y then e else 0 | y <- [1..n]] | x <- [1..n]]

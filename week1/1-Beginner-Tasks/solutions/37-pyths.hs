pyths :: Int -> Int -> [(Int, Int, Int)]
pyths from to = [(x, y, z) | z <- [from..to],
                             y <- [from..z],
                             x <- [from..y],
                             x * x + y * y == z * z]

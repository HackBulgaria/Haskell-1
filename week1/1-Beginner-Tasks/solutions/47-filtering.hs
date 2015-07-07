odds :: Integral a => [a] -> [a]
odds xs = filterBy odd

divisibles :: Int -> [Int] -> [Int]
divisibles x = filterBy $ (== 0) . (`mod` x)

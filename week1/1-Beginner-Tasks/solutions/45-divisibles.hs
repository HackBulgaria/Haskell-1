divisibles :: Int -> [Int] -> [Int]
divisibles x = filter $ (== 0) . (`mod` x)

every :: Int -> [a] -> [a]
every n xs = [x | (x, i) <- zip xs $ cycle [1..n], i == n]

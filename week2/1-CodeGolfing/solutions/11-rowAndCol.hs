row, col :: Int -> [[a]] -> [a]
row n = (!! n)

col n = map (!! n)

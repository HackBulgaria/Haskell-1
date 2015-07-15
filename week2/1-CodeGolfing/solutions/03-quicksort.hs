quicksort :: Ord a => [a] -> [a]
quicksort (x:xs) = lessers ++ [x] ++ greaters
  where lessers  = quicksort $ filter (< x) xs
        greaters = quicksort $ filter (>= x) xs
quicksort _      = []

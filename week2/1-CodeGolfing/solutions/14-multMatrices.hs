import Data.List (transpose)


multMatrices :: Num a => [[a]] -> [[a]] -> [[a]]
multMatrices m n = map (\row -> map (\col -> sum $ zipWith (*) row col) t) m
  where t = transpose n

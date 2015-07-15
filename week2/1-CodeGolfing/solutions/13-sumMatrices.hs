sumMatrices :: Num a => [[a]] -> [[a]] -> [[a]]
sumMatrices = zipWith (zipWith (+))

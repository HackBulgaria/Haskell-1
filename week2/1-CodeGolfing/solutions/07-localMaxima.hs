localMaxima :: [Integer] -> [Integer]
localMaxima (x:xs@(y:z:_))
  | y > x && y > z = y : localMaxima xs
  | otherwise      = localMaxima xs                        
localMaxima _ = []

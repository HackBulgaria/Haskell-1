mult :: Double -> [Double] -> [Double]
mult n (x:xs) = n*x : mult n xs
mult _ _      = []

double :: [Double] -> [Double]
double (x:xs) = 2*x : double xs
double _      = []

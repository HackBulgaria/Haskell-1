transpose' :: [[a]] -> [[a]]
transpose' [] = []
transpose' ([]:xs) = transpose' xs
transpose' ((x:xs):xss) = (x : [y | (y:_) <- xss]) :
  transpose' (xs : [ys | (_:ys) <- xss])

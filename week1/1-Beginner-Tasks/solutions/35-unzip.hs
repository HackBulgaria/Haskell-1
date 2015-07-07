unzip' :: [(a, b)] -> ([a], [b])
unzip' ((x,y):xys) = (x:xs, y:ys)
  where (xs, ys) = unzip' xys
unzip' _ = ([], [])

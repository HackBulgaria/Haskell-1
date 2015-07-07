concatenate :: [a] -> [a] -> [a]
concatenate (x:xs) ys = x : concatenate xs ys
concatenate _      ys = ys

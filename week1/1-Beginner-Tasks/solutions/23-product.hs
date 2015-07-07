product', product'' :: Num a => [a] -> a
product' ys = helper 1 ys
  where helper p (x:xs) = helper (p * x) xs
        helper p _      = p

product'' (x:xs) = x * product'' xs
product'' _      = 1

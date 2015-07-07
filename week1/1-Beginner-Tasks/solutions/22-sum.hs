sum', sum'' :: Num a => [a] -> a
sum' ys = helper 0 ys
  where helper s (x:xs) = helper (s + x) xs
        helper s _      = s

sum'' (x:xs) = x + sum'' xs
sum'' _      = 0

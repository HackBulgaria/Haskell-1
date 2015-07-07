group' :: Eq a => [a] -> [[a]]
group' (x:ys@(y:_)) | x == y    = (x:z) : zs
                    | otherwise = [x] : gs
  where gs@(z:zs) = group' ys
group' xs = [xs]

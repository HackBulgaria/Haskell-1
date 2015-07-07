nth :: Integer -> [a] -> a
nth n (_:xs) | n > 0 = nth (n - 1) xs
nth 0 (x:_)          = x
nth _ _              = error "Invalid index!"

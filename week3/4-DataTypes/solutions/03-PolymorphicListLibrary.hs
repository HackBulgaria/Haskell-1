safeHead :: [a] -> Maybe a
safeHead (x:_) = Just x
safeHead _ = Nothing

safeTail :: [a] -> Maybe a
safeTail (x:[]) = Just x
safeTail (x:xs) = safeTail xs
safeTail [] = Nothing

safeNth :: Int -> [a] -> Maybe a
safeNth 0 (x:_) = Just x
safeNth n (x:xs) = safeNth (n-1) xs
safeNth n [] = Nothing
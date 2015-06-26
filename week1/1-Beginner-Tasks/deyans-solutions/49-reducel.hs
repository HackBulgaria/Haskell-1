reducel :: (b -> a -> b) -> b -> [a] -> b
reducel f acc (x:xs) = reducel f (f acc x) xs
reducel _ acc _ = acc

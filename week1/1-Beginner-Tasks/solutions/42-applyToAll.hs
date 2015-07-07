applyToAll :: (a -> b) -> [a] -> [b]
applyToAll f (x:xs) = f x : applyToAll f xs
applyToAll _ _      = []

divisibles :: Integral a => a -> [a] -> [a]
divisibles d (x:xs) | x `mod` d == 0 = x : divisibles d xs
                    | otherwise      = divisibles d xs
divisibles _ _ = []

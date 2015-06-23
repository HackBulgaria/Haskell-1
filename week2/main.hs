{-# OPTIONS_GHC -fwarn-incomplete-patterns #-}
{-# LANGUAGE BangPatterns #-}

length' (_:xs) = 1 + length' xs
length' _      = 0

length'' xs = helper xs 0
  where helper (_:xs) !n = helper xs (n + 1)
        helper _      !n = n 

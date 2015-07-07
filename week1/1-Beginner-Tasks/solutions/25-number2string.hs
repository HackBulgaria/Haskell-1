import Data.Char (chr, ord)


number2string :: Int -> String
number2string n =
  if n < 10 then [chr (n + ord '0')]
  else  number2string (n `div` 10) ++ [chr (digit + ord '0')]
    where digit = n `mod` 10

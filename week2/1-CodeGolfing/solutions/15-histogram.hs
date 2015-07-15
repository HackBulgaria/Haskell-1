import Data.Char (chr)
import Data.List (intercalate, transpose)


histogram :: [Int] -> String
histogram xs = intercalate "\n" $ transpose $ map (reverse . f) [0..9]
  where f i  = char i : '=' : (stars . length . filter (== i)) xs
        char = chr . (+48)
 
stars :: Int -> String
stars n = replicate n '*' ++ replicate (9-n) ' '

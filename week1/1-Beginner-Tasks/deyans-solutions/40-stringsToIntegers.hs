import Data.Char

stringsToIntegers :: [String] -> [Int]
stringsToIntegers = map fst . map (foldr parse (0,1))
	where parse = (\x acc -> (fst acc + snd acc * (digitToInt x), snd acc * 10 ))

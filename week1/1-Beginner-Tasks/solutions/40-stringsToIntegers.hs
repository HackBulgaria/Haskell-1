stringsToIntegers :: [String] -> [Int]
stringsToIntegers (s:ss) = read s : stringsToIntegers ss
stringsToIntegers _      = []

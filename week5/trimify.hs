import System.Environment 

-- 1. Чета файла по някакъв начин
-- 2. Имам [String]
-- 3. Махам от всеки String whitespacea
-- 4. Пиша обратно

trim :: String -> String
trim = f . f
  where
    f = dropWhile (== ' ') . reverse

trimLines :: [String] -> [String]
trimLines = map trim

trimFile :: String -> String
trimFile = unlines . trimLines . lines

main = do
  (fileName:_) <- getArgs
  putStrLn fileName
  contents <- readFile fileName
  writeFile (fileName ++ ".result") (trimFile contents)


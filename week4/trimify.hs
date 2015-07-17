import System.IO
import System.Environment 
-- 1. Чета файла по някакъв начин
-- 2. Имам [String]
-- 3. Махам от всеки String whitespace-a
-- 4. Пиша обратно

trim :: String -> String
trim = f . f
  where
    f = dropWhile isWhiteSpace . reverse
    isWhiteSpace x = elem x [' ', '\t']

trimLines :: [String] -> [String]
trimLines = map trim

trimFile :: String -> String
trimFile = unlines . trimLines . lines

main = do
  (fileName:_) <- getArgs
  handle <- openFile fileName ReadMode
  contents <- hGetContents handle
  hClose handle
  writeFile fileName (trimFile contents)

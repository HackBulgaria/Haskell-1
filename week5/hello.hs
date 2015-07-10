exclamate :: String -> String
exclamate s = s ++ "!"

main :: IO ()
main = do
  name <- getLine
  let exclamatedName = exclamate name
  print $ exclamatedName

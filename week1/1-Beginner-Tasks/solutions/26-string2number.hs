string2number :: String -> Int
string2number cs = helper 0 cs
  where helper res (c:cs) = helper (10 * res + ord c - ord '0') cs
        helper res _      = res

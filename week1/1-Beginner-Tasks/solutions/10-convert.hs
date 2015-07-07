convert :: String -> String -> Double -> Double
convert "usd" "bgn" x = x * 1.72
convert "bgn" "usd" x = x * 0.58
convert "usd" "eur" x = x * 0.88
convert "eur" "usd" x = x * 1.13
convert "bgn" "eur" x = x * 0.51
convert "eur" "bgn" x = x * 1.96

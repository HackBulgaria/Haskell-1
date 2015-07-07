isTriangle :: Double -> Double -> Double -> Bool
isTriangle a b c = validSides && (a + b) > c && (b + c) > a && (a + c) > b
  where validSides = a > 0 && b > 0 && c > 0

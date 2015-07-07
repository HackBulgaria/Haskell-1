isTriangleList :: [Double] -> Bool
isTriangleList [a, b, c] = validSides && (a + b) > c && (b + c) > a && (a + c) > b
  where validSides = a > 0 && b > 0 && c > 0

perimeterList, areaList :: [Double] -> Double
perimeterList [a, b, c] = a + b + c

areaList [a, b, c] = sqrt $ p * (p - a) * (p - b) * (p - c)
  where p = perimeterList [a, b, c] / 2

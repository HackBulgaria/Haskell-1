area :: Double -> Double -> Double -> Double
area a b c = sqrt $ p * (p - a) * (p - b) * (p - c)
  where p = perimeter a b c / 2

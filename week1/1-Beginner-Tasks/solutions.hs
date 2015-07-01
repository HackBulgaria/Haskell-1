import Data.Char (chr, ord)


even', odd' :: Integer -> Bool
even' x = x `mod` 2 == 0

odd' x = not (even' x)

bmi :: Double -> Double -> Double
bmi height weight = weight / (height / 100)^2

deg2Rad, rad2Deg :: Double -> Double
deg2Rad x = pi * (x / 180)

rad2Deg x = (x * 180) / pi

isTriangle :: Double -> Double -> Double -> Bool
isTriangle a b c = validSides && (a + b) > c && (b + c) > a && (a + c) > b
  where validSides = a > 0 && b > 0 && c > 0

perimeter, area :: Double -> Double -> Double -> Double
perimeter a b c = a + b + c

area a b c = sqrt (p * (p - a) * (p - b) * (p - c))
  where p = perimeter a b c / 2

calculate :: Char -> Double -> Double -> Double
calculate '+' x y = x + y
calculate '*' x y = x * y
calculate '-' x y = x - y

convert :: String -> String -> Double -> Double
convert "usd" "bgn" x = x * 1.72
convert "bgn" "usd" x = x * 0.58
convert "usd" "eur" x = x * 0.88
convert "eur" "usd" x = x * 1.13
convert "bgn" "eur" x = x * 0.51
convert "eur" "bgn" x = x * 1.96

isTriangleList :: [Double] -> Bool
isTriangleList [a, b, c] = validSides && (a + b) > c && (b + c) > a && (a + c) > b
  where validSides = a > 0 && b > 0 && c > 0

perimeterList, areaList :: [Double] -> Double
perimeterList [a, b, c] = a + b + c

areaList [a, b, c] = sqrt (p * (p - a) * (p - b) * (p - c))
  where p = perimeterList [a, b, c] / 2

head' :: [a] -> a
head' (x:_) = x
head' _     = error "You cannot have the head of the empty list!"

tail' :: [a] -> [a]
tail' (_:xs) = xs
tail' _      = error "The empty list has no tail!"

last' :: [a] -> a
last' [x]    = x
last' (_:xs) = last' xs
last' []     = error "The empty list has no last element!" 

double :: [Double] -> [Double]
double (x:xs) = 2*x : double xs
double _      = []

mult :: Double -> [Double] -> [Double]
mult n (x:xs) = n*x : mult n xs
mult _ _      = []

nth :: Integer -> [a] -> a
nth n (_:xs) | n > 0 = nth (n - 1) xs
nth 0 (x:_)          = x
nth _ _              = error "Invalid index!"

member :: Eq a => a -> [a] -> Bool
member elem (x:xs) = elem == x || member elem xs
member _    _      = False

isFibonacciSequence :: [Int] -> Bool
isFibonacciSequence (x:zs@(y:z:_)) = x + y == z && isFibonacciSequence zs
isFibonacciSequence _ = True

sum' :: Num a => [a] -> a
sum' ys = helper 0 ys
  where helper s (x:xs) = helper (s + x) xs
        helper s _      = s

product' :: Num a => [a] -> a
product' ys = helper 1 ys
  where helper p (x:xs) = helper (p * x) xs
        helper p _      = p

multLists :: Num a => [a] -> [a] -> [a]
multLists (x:xs) (y:ys) = x * y : multLists xs ys
multLists _      _      = []

number2string :: Int -> String
number2string n =
  if n < 10 then [chr (n + ord '0')]
  else  number2string (n `div` 10) ++ [chr (digit + ord '0')]
    where digit = n `mod` 10

string2number :: String -> Int
string2number cs = helper 0 cs
  where helper res (c:cs) = helper (10 * res + ord c - ord '0') cs
        helper res _      = res

-- isValidID
-- whatZodiacSignIs

concatenate :: [a] -> [a] -> [a]
concatenate (x:xs) ys = x : concatenate xs ys
concatenate _      ys = ys

init' :: [a] -> [a]
init' [x]    = []
init' (x:xs) = x : init' xs
init' _      = error "You can't do that on the empty list!"

take' :: Int -> [a] -> [a]
take' n (x:xs) | n > 0 = x : take' (n - 1) xs
take' _ _ = []

drop' :: Int -> [a] -> [a]
drop' n (x:xs) | n > 0 = drop' (n - 1) xs
drop' _ xs = xs

zip' :: [a] -> [b] -> [(a, b)]
zip' (x:xs) (y:ys) = (x,y) : zip' xs ys
zip' _      _      = []

unzip' :: [(a, b)] -> ([a], [b])
unzip' ((x,y):xys) = (x:xs, y:ys)
  where (xs, ys) = unzip' xys
unzip' _ = ([], [])

group' :: Eq a => [a] -> [[a]]
group' (x:ys@(y:_)) | x == y    = (x:z) : zs
                    | otherwise = [x] : gs
  where gs@(z:zs) = group' ys
group' xs = [xs]

pyths :: Int -> Int -> [(Int, Int, Int)]
pyths from to = [(x, y, z) | z <- [from..to],
                             y <- [from..z],
                             x <- [from..y],
                      x * x + y * y == z * z]

multiplyBy :: Int -> (Int -> Int)
multiplyBy y = \x -> x * y

lastDigits :: [Int] -> [Int]
lastDigits (x:xs) = x `mod` 10 : lastDigits xs
lastDigits _      = []

stringsToIntegers :: [String] -> [Int]
stringsToIntegers (s:ss) = read s : stringsToIntegers ss
stringsToIntegers _      = []

fibonaccis :: [Int] -> [Integer]
fibonaccis (x:xs) = fib 0 1 0 : fibonaccis xs
  where fib n m i | i == x    = n
                  | otherwise = fib m (n+m) (i + 1)
fibonaccis _      = []

applyToAll :: (a -> b) -> [a] -> [b]
applyToAll f (x:xs) = f x : applyToAll f xs
applyToAll _ _      = []

odds :: Integral a => [a] -> [a]
odds (x:xs) | odd x     = x : odds xs
            | otherwise = odds xs
odds _ = []

divisibles :: Integral a => a -> [a] -> [a]
divisibles d (x:xs) | x `mod` d == 0 = x : divisibles d xs
                    | otherwise      = divisibles d xs
divisibles _ _ = []

filterBy :: (a -> Bool) -> [a] -> [a]
filterBy p (x:xs) = if p x then x : filterBy p xs else filterBy p xs
filterBy _ _      = []

concat' :: [[a]] -> [a]
concat' (x:xs) = x ++ concat' xs
concat' _      = []

reduce :: (a -> b -> a) -> a -> [b] -> a
reduce f acc (x:xs) = reduce f (f acc x) xs
reduce _ acc _      = acc

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys
zipWith' _ _      _      = []

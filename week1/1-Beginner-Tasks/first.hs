add x y  = x + y

-- 01. Even
evenn :: Integer -> Bool
evenn number = if number `mod` 2 == 0 then True else False

-- 02. Odd
oddn :: Integer -> Bool
oddn number = if number `mod` 2 /= 0 then True else False

-- 03. Calculate BMI
bmi :: Double -> Double -> Double
bmi height weight = weight / ((height / 100) ^ 2)

-- 04. Convert degrees to radians
deg2Rad, rad2Deg :: Double -> Double
deg2Rad degree = (degree /180 ) * pi

-- 05. Convert radians to degrees
rad2Deg radians = (radians / pi) * 180

-- 06. Does it form a triangle?
isTriangle, isTriangle1 :: Int -> Int -> Int ->  Bool
isTriangle  a b c = if (a + b > c) && (a + c > b) && (b + c > a) && a > 0 && b > 0 && c > 0 then True else False

isTriangle1  a b c = (a + b > c) && (a + c > b) && (b + c > a) && a > 0 && b > 0 && c > 0 

-- 07. Perimeter of a triangle
perimeter :: Double -> Double -> Double -> Double
perimeter a b c = a + b + c

-- 08. Area of a triangle
area :: Double -> Double -> Double -> Double
area a b c = sqrt(((perimeter a b c ) / 2) * ((perimeter a b c)/2 - a) * ((perimeter a b c)/2 - b) * ((perimeter a b c)/2 - c))

-- 09. Calculate
calculate :: Char -> Integer -> Integer -> Integer
calculate sign x y = if sign == '+'
					then x + y else
					if sign == '-'
					then x - y else
					if sign == '*'
					then x * y else
					error "Unknown operator!"

-- 10. Currency Converter (working with dollars, levs and euros)
convert :: String -> String -> Double -> Double
convert str1 str2 money
	| str1 == "bgn" && str2 == "usd" = money / 1.737
	| str1 == "usd" && str2 == "bgn" = money * 1.737
	| str1 == "bgn" && str2 == "eur" = money / 1.959
	| str1 == "eur" && str2 == "bgn" = money * 1.959
	| str1 == "eur" && str2 == "usd" = money * 1.116
	| str1 == "usd" && str2 == "eur" = money / 1.116

-- 13. Head
headd, lastt :: [a] -> a
headd (h:t) = h
headd [] = error "list is empty"

-- 14. Tail
taill :: [a] -> [a]
taill (h:t) = t
taill [] = error "List is empty"

-- 16. Last
lastt (h:[]) = h
lastt (h:t) = lastt t
lastt [] = error "Empty list"

-- 17. Double all elements
-- double :: [a] -> [b]
double [] = []
double (h:t) = h * 2 : double(t)

-- TO ASK for recursion
-- 18. More generic - make it possible to multiply all elements in a list with a given number
mult number [] = []
mult number (h:t) = (h * number) : mult number t

-- To ask for signature
-- 19. Get the n-th element of a list
-- nth :: a-> [b] -> b
nth 1 (h:t) = h
nth number (h:t) = nth (number-1) t

-- 20. Is an element member of a list?
-- member :: a -> [a] -> Bool
member number [] = False
member number (h:t) = if h == number
						then True
						else member number t

-- 21. Is the list a fibonacci sequence?
-- isFibonacciSequence :: [a] -> Bool
isFibonacciSequence (h:(h2:(h3:[]))) = if h + h2 /= h3
										then False
										else True
isFibonacciSequence (h:(h2:(h3:t))) = if h + h2 /= h3
										then False
										else isFibonacciSequence (h2:(h3:t))

-- 22. Get the sum of a list
summ, productt :: [Int] -> Int
summ (h:[]) = h
summ (h:t) = h + summ t

-- 23. Get the product of a list
productt (h:[]) = h
productt (h:t) = h * productt t

-- 24. Multiply lists
multLists :: [Int] -> [Int] -> [Int]
multLists [] [] = []
multLists arr [] = []
multLists [] arr = []
multLists (h1:t1) (h2:t2) = h1 * h2 : multLists t1 t2

-- isValidID id = (id.lenght == 10) && sum(id)%11 = 0

-- 30  Concatenate the lists
concatenate :: [a] -> [a] -> [a]
concatenate [] second = second
concatenate first [] = first
concatenate (h:t) second = h : concatenate t second

-- 31Take all elements of a list without the last one
initt [] = error "You can't do that with the empty list!"
initt (h:[]) = []
initt (h:t) = h : initt t

-- 32 Take the first n elements from a list
takee, dropp :: Int -> [a] -> [a]
takee _ [] = []
takee 0 _ = []
takee number (h:t) = h : takee (number-1) t

-- 33. Drop the first n elements from a list
dropp _ [] = []
dropp 0 arr = arr
dropp number (h:t) = dropp (number - 1) t

-- 34. Zipping lists
zipp :: [a] -> [b] -> [(a, b)]
zipp [] [] = []
zipp arr [] = []
zipp [] arr = []
zipp (h1:t1) (h2:t2) = (h1, h2) : zipp t1 t2


-- unzipp :: [(a,b)] -> ([c])
-- unzipp
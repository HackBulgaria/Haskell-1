## Tasks

### 01. Even
```
even' 42 -> True
even' 7 -> False
```

### 02. Odd
```
odd' 42 -> False
odd' 7 -> True
```

### 03. Calculate BMI

BMI is calculated by the following formula -> bmi height weight = weight / (height^2)

```
bmi 1.5 40 -> 17.8
```

### 04. Convert degrees to radians
```
deg2Rad 180 -> pi
deg2Rad 90 -> pi/2
```

### 05. Convert radians to degrees
```
rad2Deg (pi/2) -> 90
rad2Deg (3*pi/2) -> 270
```

### 06. Does it form a triangle?
```
isTriangle 1 1 1 -> True
isTriangle 1 1 2 -> False
```

### 07. Perimeter of a triangle
```
perimeter 3 4 5 -> 12
perimeter 13 14 15 -> 42
```

### 08. Area of a triangle
```
area 3 4 5 -> 6
area 13 14 15 -> 84
```

### 09. Calculate
```
calculate '+' 2 3 -> 5
calculate '*' 2 3 -> 6
calculate '-' 2 3 -> -1
```

### 10. Currency Converter (working with dollars, levs and euros)
```
convert "usd" "bgn" 1 -> 1.737
convert "eur" "bgn" 10 -> 19.59
```

### 11. Type signatures
Add type signatures for all the functions you wrote.

From now on, we'll be always writing the type signatures!


### 12. Rewrite the triangle functions from above to get lists as arguments

### 13. Head
```
head' [1, 2, 3] -> 1
```

### 14. Tail
```
tail' [1, 2, 3] -> [2, 3]
```

### 15. We love pattern matching!
Rewrite some of the above functions to use pattern matching when appropriate

* the non-exhaustive pattern problem - when no pattern can be matched, haskell doesn't know what to do..

Hint: you can use the function `error msg` to stop execution and display a message, for example:
`head' [] -> "you've lost your head! you can't do this on the empty list.."`

### 16. Last
```
last' [1, 2, 3] -> 3
last' [] -> an error message
```

### 17. Double all elements
```
double [1, 2, 3] -> [2, 4, 6]
double [] -> []
```

### 18. More generic - make it possible to multiply all elements in a list with a given number
```
mult 3 [1, 2, 3] -> [3, 6, 9]
mult 42 [] -> []
```

### 19. Get the n-th element of a list
```
nth 3 [1, 2, 3, 4] -> 4
nth 0 [1, 2, 3] -> 1
nth 2 [1] -> error message
```

### 20. Is an element member of a list?
```
member 3 [1, 2, 3] -> True
member 2 [0, 1, 3] -> False
```

### 21. Is the list a fibonacci sequence?

Edit: Assume that the input we'll be correct, i.e. will be a list
starting from 0 and will have more than two elements.
```
isFibonacciSequence [0, 1, 1] -> True
isFibonacciSequence [0, 1, 1, 2, 3, 5, 8, 13] -> True
isFibonacciSequence [0, 1, 1, 1, 2] -> False
```

### 22. Get the sum of a list
```
sum' [1, 2, 10] -> 13
```

### 23. Get the product of a list
```
product' [1, 2, 10] -> 20
```
### 24. Multiply lists
```
multLists [1, 2, 3] [2, 3, 4] -> [2, 6, 12]
multLists [3] [1, 2, 3] -> [3]
```

### 25. Number to string
```
number2string 123 -> "123"
```
Hint: import Data.Char (chr, ord)


### 26. String to number
```
string2number "3212" -> 3212
```

### 27. Is valid ID?
[the rules of forming a valid ID](https://bg.wikipedia.org/wiki/%D0%95%D0%B4%D0%B8%D0%BD%D0%B5%D0%BD_%D0%B3%D1%80%D0%B0%D0%B6%D0%B4%D0%B0%D0%BD%D1%81%D0%BA%D0%B8_%D0%BD%D0%BE%D0%BC%D0%B5%D1%80)
```
isValidID "6101047500" -> True
```

### 28. Get the zodiac sign from an ID
```
whatZodiacSignIs "6101047500" -> "Capricorn"
```

### 29. More type signatures!

Add the type signatures to all function that ain't got one.

Use that you already know how to write type signatures to the polymorphic functions!

### 30. Concatenate the lists
```
concatenate [1, 2, 3] [2, 3, 4] -> [1, 2, 3, 2, 3, 4]
```

### 31. Take all elements of a list without the last one
```
init' [1, 2, 3] -> [1, 2]
init' []        -> "You can't do that with the empty list!"
```

### 32. Take the first n elements from a list
```
take' 3 [1..10] -> [1, 2, 3]
take' 3 [1, 2]  -> [1, 2]
```

### 33. Drop the first n elements from a list
```
drop' 3 [1..10] -> [4, 5, 6, 7, 8, 9, 10]
drop' 3 [1, 2]  -> []
```

### 34. Zipping lists
```
zip' [1, 2, 3] ['a', 'b', 'c'] -> [(1, 'a'), (2, 'b'), (3, 'c')]
zip' ["we", "like", "to"] ["party"] -> [("we", "party")]
```

### 35. Now unzip it!
```
unzip' [(1, 2), (2, 3), (3, 4)] -> ([1, 2, 3], [2, 3, 4])
unzip' [("I", "surely"), ("do", "not"), ("like", "you")] -> (["I", "do", "like"], ["surely", "not", "you"])
```

### 36. Grouping
```
group' [1, 1, 2, 2, 1, 1, 3] -> [[1, 1], [2, 2], [1, 1], [3]]
group' [1..5] -> [1, 2, 3, 4, 5]
```

### 37. Generate all pythagorean triples
```
pyths 1 10 -> [(3,4,5), (6,8,10)]
```

### 38. Return a function, which multiplies a number by a factor
```
let multiplyByTwo = multiplyBy 2
multiplyByTwo 3 -> 6
multiplyByTwo 9 -> 18
```

### 39. Get the last digit of all numbers in a list
```
lastDigits [10..19] -> [0,1,2,3,4,5,6,7,8,9]

```

### 40. Turn all strings in a list to integers

You can expect that the input will be always valid!

```
stringsToIntegers ["7", "42", "13"] -> [7, 42, 13]
```

### 41. Get the fibonacci numbers with the corresponding indices
```
fibonaccis [0..5] -> [0, 1, 1, 2, 3, 5]
fibonaccis [5, 10, 15] -> [5, 55, 610]
```

Did you notice the pattern?

### 42. Take a function and apply it to all elements of a list
```
let lastDigits = applyToAll (`mod` 10)
lastDigits [10..19] -> [0,1,2,3,4,5,6,7,8,9]
```

### 43. Rewrite all of the above functions to use applyToAll

### 44. Get all odd numbers in a list
```
odds [1..10] -> [1,3,5,7,9]
```

### 45. More generic - return a function that filters all the numbers in a list divisible by 'n'
```
let divisibleByThree = divisibles 3
divisibleByThree [1..10] -> [3,6,9]
```

Again, the pattern!

### 46. Take a predicate and filter a list
```
let odds' = filterBy odd
odds' [1..10] -> [1,3,5,7,9]
```

### 47. Rewrite the functions using filterBy

### 48. Get the product of a list
```
product' [1..5] -> 120
```

### 49. Concatenate the lists
```
concat' [[1, 2, 3], [2, 3, 4], []] -> [1,2,3,2,3,4]
```

These patterns..

### 50. Reducing!
```
let sum'' = reduce (+) 0
sum'' [1..10] -> 55
```

### 51. Reduce in the other direction
```
(reduce (-) 0) [1..5] -> 0-1-2-3-4-5 -> -15
(reduce' (-) 5) [1..5] -> 1-(2-(3-(4-(5-0)))) -> 3
```

### 52. Zip with a function!
```
let zip'' = zipWith' (++)
zip'' [1..3] [3..5] -> [(1, 3), (2, 4), (3, 5)]

let sums = zipWith' (+)
sums [1..3] [3..5] -> [4, 6, 8]
```

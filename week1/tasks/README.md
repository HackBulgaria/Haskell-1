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
```
bmi 150 40 -> 17.8
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
```
isFibonacciSequence [1, 1] -> True
isFibonacciSequence [0, 1, 1, 2, 3, 5, 8, 13] -> True
isFibonacciSequence [1, 1, 1, 2] -> False
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
mult [1, 2, 3] [2, 3, 4] -> [2, 6, 18]
mult [3] [1, 2, 3] -> [3]
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

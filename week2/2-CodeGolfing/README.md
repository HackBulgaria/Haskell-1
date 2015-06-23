## Code Golf!

### 01. Map as foldl
Implement the function `map` using `foldl`

### 02. Filter as foldl
Implement Prelude's `filter` using `foldl`

### 03. [Quicksort!](https://en.wikipedia.org/?title=Quicksort)

### 04. Repeat
Make an infinite list by repeating a given element
```
repeat 1 -> [1, 1, 1, 1, 1, 1, 1..]
```

### 05. Cycling!
Make an infinite list by repeating a given list
```
cycle [1, 2] -> [1, 2, 1, 2, 1, 2..]
cycle [1, 2, 3] -> [1, 2, 3, 1, 2, 3, 1, 2, 3..]
cycle [] -> []
```

### 06. Take every nth element from a list
```
every 1 [1, 2, 3] -> [1, 2, 3]
every 2 [1, 2, 3] -> [2]
```

### 07. Get the local maximas in a list of `Integer`s
```
localMaxima [1..10] -> []
localMaxima [1, 2, 1, 2, 3, 0, 6] -> [2, 3]
```

### 08. Map a function to a list of lists
```
mapMap (^2) [[1], [1, 2, 3], []] -> [[1], [1, 4, 9], []]
```

### 09. Filter a list of lists
```
filterFilter ((== 0) . (`mod` 2)) [[1], [1, 2, 3], []] -> [[], [2], []]
```

### 10. Generate the unit matrix by given element and dimensions
```
unit 1 3 -> [[1, 0, 0], [0, 1, 0], [0, 0, 1]]
unit 2 2 -> [[2, 0], [0, 2]]
```

### 11. Get the nth row and column of a matrix
```
row 1 [[1, 2, 3], [2, 3, 4]] -> [2, 3, 4]
row 8 (unit 1 10) -> [0, 0, 0, 0, 0, 0, 0, 0, 1, 0]
```

### 12. Transpose a matrix
```
transpose' [[1, 2, 3], [2, 3, 4]] -> [[1, 2], [2, 3], [3, 4]]
transpose' (unit 1 2) -> [[1, 0], [0, 1]]
transpose' [[1, 2], [3, 4], [5, 6]] -> [[1, 3, 5], [2, 4, 6]]
```

### 13. Sum of matrices
```
sumMatrices (unit 2 2) (unit 3 2) == unit 5 2 -> True
```

### 14. Multiply matrices
```
multMatrices [[1, 2], [3, 4]] [[1, 2], [3, 4]] -> [[7, 10], [15, 22]]
```

### 15. Histogram
```
histogram [1, 2, 1, 3, 1] ->
" *
  *
  * * *
0 1 2 3 4 5 6 7 8 9"
```

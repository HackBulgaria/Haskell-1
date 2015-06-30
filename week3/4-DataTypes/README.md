## Data types!

### 01. An IntList library
#### Implement a IntList library, so that you should be able to use an IntList like an [Int], plus:
* create a mapping from IntList to [Int] and from [Int] to IntList i.e.
```
fromList :: [Int] -> IntList
toList   :: IntList -> [Int]
```

`Note: implement filter, fold and map too`

### 02. Implement a  music library

#### Create an appropriate data type, so that the library can do the following things (after implementing them, of course):
* adding a song to the library
* removing a song from the library
* removing all songs by an author
* searching for song information by title, album or author
* getting information about an author

A song should have:
* title, author, genre, length

An author should have:
* name, birth year, record label (if one)

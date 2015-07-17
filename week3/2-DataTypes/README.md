## Data types!

### 01. An IntList library
#### Implement a IntList library, so that you should be able to use an IntList like an [Int], plus:
* create a mapping from IntList to [Int] and from [Int] to IntList i.e.
```
fromList :: [Int] -> IntList
toList   :: IntList -> [Int]
```

`Note: implement filter, fold and map too`

### 02. Implement a music library
#### Create an appropriate data type, so that the library can do the following things (after implementing them, of course):
* adding a song to the library
* removing a song from the library
* removing all songs by an author
* searching for song information by title, album or author
* getting information about an author

A song should have:
* title, author, genre, length, album

An author should have:
* name, birth year, record label (if one)

### 03. A Polymorphic list library
#### Rewrite the IntList library to work with more types than an Ints

After that, you should be able to define the previous IntList type
with:

```haskell
type IntList = List Int
```

##### Add more extras:
* write safeHead, safeTail and safeNth functions:
```
head Nil -> Nothing
head (Cons 2 (Cons 3 Nil)) -> Just 2
```

### 04. A simple interpreter
Your task is to write a simple imperative language interpreter.

For now, you will have the parsed statements, but later we will learn
how to parse them ourselves!

* Your program will be able to interpret statements like this:

```haskell
Assign "sum" (Val 0)
For (Assign "i" (Val 0))
    (Op (Var "i") Lt (Val 10))
    (Incr "i")
    (Assign "sum" (Op (Var "sum") Plus (Var "i")))
```

* You will have a state, which is represented by the following data types:
(Why do we have a list of statements and a map of variables and values?)

```haskell
data Statement = ...

type Variables = Map.Map Variable Value

data State = State [Statement] Variables
  deriving (Show, Eq)
```
Our language will have `= ++ -- if for` as statements.

* For now, we'll be working with any strings as variable names and only Int values
```haskell
type Variable = String
type Value    = Int
```

* That might help:
```haskell
data Expr = Var Variable
          | Val Value
          | Op  Expr Oper Expr
  deriving (Show, Eq)
```

* It'll be helpful to implement the following data types (think carefully):
```haskell
data Oper = ...
```

Also, we have `+ - / % > >= < <= ==` as operators. Keep in mind, that we have only `Int`s as values!

##### More notes:
* We won't care for the scope of variables, yet (you can assume, that there won't be any duplication in the variables' names)
* Check [the strict map's documentation in Hackage](http://hackage.haskell.org/package/containers-0.5.6.3/docs/Data-Map-Strict.html)
* After evaluating the statements in the example above, the value of "sum" in the state should be 55
* Here are the type signatures for some of the functions you should write:
```haskell
-- Evaluate an expression
evalE :: Expr -> Variables -> Value

-- Execute the current statement and update the state
execS :: State -> State
```

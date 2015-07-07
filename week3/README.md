# Functional programming - week 3

[Day 1](./README.md#day-1)

[Day 2](./README.md#day-2)
 
## Day 1

## Haskell's package manager - [Cabal](https://www.haskell.org/cabal/)

`> cabal --version`

* Sandboxes - `cabal sandbox init`
* Cabal packages - `cabal install`
* Properties in `.cabal` files

#### The whole cabal workflow we used:
```
# updating the cabal's list of packages
> cabal update

# upgrading cabal to it's latest version
> cabal install cabal-install

# move to your module's directory, then
> cabal init
# is creating a new .cabal package file

# creating a sandbox
> cabal sandbox init

# afterwards, you can freely install packages locally with 
> cabal install

# building and running an executable
# while developing (like in the Fractal's module case)
> cabal run
```

## [Try it yourself](./3-Fractals/README.md#let's-draw-some-fractals!)
![Mandelbrot's Fractal](./mandelbrot.png)

## Data types once more..

### The `data` keyword
* Type constructors vs value constructors

```haskell
data BookType = Book String String Int
    deriving (Show)

> let myFavouriteBook = Book "A Study in Scarlet" "Sir Arthur Conan Doyle" 1887
> myFavouriteBook
Book "A Study in Scarlet" "Sir Arthur Conan Doyle" 1887
> :t myFavouriteBook
myFavouriteBook :: BookType

-- But more often:
data Book = Book String String Int
    deriving (Show)
```
* Pattern matching against a type
```haskell
bookTitle :: Book -> String
bookTitle (Book title _ _) = title
```
* Remember the type synonyms?
```haskell
type Title  = String
type Author = String
type Year   = Int

data Book = Book Title Author Year

bookTitle :: Book -> Title
```

### The record syntax
```haskell
data Book = Book {
    bookTitle  :: Title,
    bookAuthor :: Author,
    bookYear   :: Year
  } deriving (Show)

-- Now we can create a Book like that:
> let myBook = Book { bookYear = 1900, bookTitle = "title", bookAuthor = "author" }
```
* Check `:t bookTitle` in ghci. Haskell implemented all
these functions for us! How convenient ^^

### Algebraic Data Types
* They do look a lot like unions
```haskell
data MyBool = MyTrue | MyFalse
  deriving (Eq, Show)

myNot :: MyBool -> MyBool
myNot MyTrue = MyFalse
myNot MyFalse = MyTrue
```

* Every value constructor can have zero or more arguments
```haskell
data IntList = Cons Int IntList | Empty
  deriving (Show)
```

## [Task](./4-DataTypes/README.md#01-an-intlist-library)

## Day 2

This time we'll be revising what we have learnt about data types.

* defining new data types with `data` - type and value constructors
* the record syntax
* pattern matching value constructors

## [Task](./4-DataTypes/README.md#02-implement-a-music-library)

### Even more data types!

* parameterised types

```haskell
-- Maybe a
data Shell a = An a
             | Empty
```

* ADTs again, but this time with type variables! (what was an [ADT](./README.md#algebraic-data-types)?)

```haskell
data List a = Cons a IntList | Empty
  deriving (Show)
```

### We mentioned about the `case of` syntax:
```haskell
getJust :: Maybe a -> a
getJust x = case x of
            Just a  -> a
            _       -> error "It's Nothing!"
--          Nothing -> error "It's Nothing!"
```

## [Task](./4-DataTypes/README.md#03-a-polymorphic-list-library)

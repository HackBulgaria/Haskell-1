## Functors and Applicatives

### 01. The Binary tree functor
#### Ookay, I hope you can guess why the `BTree` is a functor. Now create the functor instance for it!

```
data BTree a = Node a (BTree a) (BTree a) | Leaf a | Nil
  deriving (Show)
```

### 02. The pair functor
#### Implement a `Functor` instance for the tuple (a, b).

### 03. Simple Parser
#### Implement the following parser datatype:
(Check the file [`Parser.hs'](./Parser.hs)

```haskell
newtype Parser a =
  Parser { parse :: String -> Maybe (a, String) }

instance Functor Parser where

instance Applicative Parser where

satisfy :: (Char -> Bool) -> Parser Char
char :: Char -> Parser Char
openingBrace :: Parser Char
closingBrace :: Parser Char

inBraces :: Parser a -> Parser a

instance Alternative Parser where

oneOrMore  :: Parser a -> Parser [a]
zeroOrMore :: Parser a -> Parser [a]
```

Functionality examples:

```
> parse (satisfy (== '!')) "!!!"
Just ('!', "!!") 
> parse (satisfy (== '!')) "Hi!"
Nothing
>
> parse (char 'H') "High five!"
Just ('H', "igh five!")
> parse (char 'H') "Down low!"
Nothing
>
> parse openingBrace "(++i)"
Just ('(', "++i)")
>
> parse (inBraces $ char '+') "(+)"
Just ('+', "")
> parse (inBraces $ char '+') "(-)"
Nothing
>
> parse (oneOrMore openingBrace) "(((okay"
Just ("(((", "okay")
> parse (oneOrMore openingBrace) ")))not okay"
Nothing
>
> parse (zeroOrMore openingBrace) "(((okay"
Just ("(((", "okay")
> parse (zeroOrMore openingBrace) ")))okay"
Just ("", ")))okay")
```

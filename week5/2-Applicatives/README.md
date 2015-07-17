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
Just ('+', "+i)")
>
> parse (inBraces $ char '+') "(+)"
Just ('+', "")
> parse (inBraces $ char '+') "(-)"
Nothing
>
> oneOrMore openingBrace "(((okay"
Just ("(((", "okay")
> oneOrMore openingBrace ")))not okay"
Nothing
>
> zeroOrMore openingBrace "(((okay"
Just ("(((", "okay")
> zeroOrMore openingBrace ")))okay"
Just ("", ")))okay")
```

### 04. An expression parser
#### Now using the already written simple parser, write a statement parser!

```haskell
instance Alternative Parser where

interpret :: Parser [Statement]
```

If we have the file `test` with the content

```
var sum = 0;
for (var i = 0; i < 10; ++i) {
    sum = sum + i;
}
```

```
> let content = readFile test
> parse interpret content
[Assign "sum" (Val 0), For (Assign "i" (Val 0)) (Op (Var "i") Lt (Val 10)) (Incr "i") (Assign "sum" (Op (Var "sum") Plus (Var "i")))]
```

** Hints **
Breakdown the whole thing into many small parsers. I.e.:
```
oper      :: Parser Oper
variable  :: Parser Variable
value     :: Parser Value
expr      :: Parser Expr
assign,
incr,
decr, ..  :: Parser Statement
```

Then, use the alternative and applicative instances wisely!

### 05. Now construct a whole interpreting program, which should do the following:
```
runhaskell Main.hs "test"

State after executing the program:

sum = 45
i = 10
```

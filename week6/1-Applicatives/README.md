## More Applicatives


### 01. An expression parser
#### Now using the already written simple parser, write a statement parser!

##### Note: If you didn't complete the previous tasks, here are some modules you can use:
* [Interpreter](./Interpreter.hs)
* [Statement](./Statement.hs)
* [Parser](./Parser.hs)

Your task is to implement the functions from the [StatementParser](./StatementParser.hs) file.

```haskell
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
> content <- readFile "test"
> parse interpret content
Just ([Assign "sum" (Val 0), For (Assign "i" (Val 0)) (Op (Var "i") Lt (Val 10)) (Incr "i") (Assign "sum" (Op (Var "sum") Plus (Var "i")))], "")
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

### 02. Now construct a whole interpreting program, which should do the following:
```
runhaskell Main.hs "test"

State after executing the program:

sum = 45
i = 10
```

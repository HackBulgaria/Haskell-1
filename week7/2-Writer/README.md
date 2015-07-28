## The Writer Monad

### 01. The Writer
#### Implement the `Writer` monad's functionality
```haskell
newtype Writer w a = Writer { runWriter :: (a, w) }

execWriter :: Writer w a -> w
mapWriter :: ((a, w) -> (b, w')) -> Writer w a -> Writer w' b
tell :: w -> Writer w ()
```

### 02. Instances
#### Make instances of `Functor`, `Applicative` and `Monad` for the `Writer`.

### 03. Calculator
#### Write a simple RPN calculator (check [Reversed polish notation](https://en.wikipedia.org/wiki/Reverse_Polish_notation))
##### Let it work with `Integers` and the operations + - * / (div) % (mod)
##### Here, we don't care about priority
```haskell
calculate "2 3 + 3 * 12 -" -> 3

-- calculate "2 3 + 3 * 12 -"
-- calculate "2 3 + 3 *" - 12
-- calculate "2 3 +" * 3 - 12
-- 5 * 3 - 12
-- 3
```
* Note/Hint: Do you know what a stack is?


### 04. Calculator and Writer
#### Now extend the calculator's functionality, so that it can log information about every calculation done.

### 05. Now using the writer, add functionality to the `Interpreter` module from week 3, so that it's possible log information for every statement execution.

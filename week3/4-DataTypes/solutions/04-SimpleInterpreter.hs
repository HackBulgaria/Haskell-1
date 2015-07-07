import qualified Data.Map.Strict as Map

type Variable  = String
type Value     = Int
type Variables = Map.Map Variable Value

data Statement = Assign Variable Expr | Incr Variable | Decr Variable | If Expr Statement | For Statement Expr Statement Statement
  deriving (Show, Eq)

data State = State [Statement] Variables
  deriving (Show, Eq)

data Oper = Plus | Minus | Div | Mult | Mod | Gt | Ge | Lt | Le | Eq 
  deriving (Show, Eq)

data Expr = Var Variable
          | Val Value
          | Op  Expr Oper Expr
  deriving (Show, Eq)


evaluateExpression :: Expr -> Variables -> Value
evaluateExpression (Val x) variables = x
evaluateExpression (Var x) variables = case Map.lookup x variables of
                                            Just v -> v
                                            _ -> error "Value not found"
                                            
evaluateExpression (Op expr1 Plus expr2) variables  = evaluateExpression expr1 variables + (evaluateExpression expr2 variables)
evaluateExpression (Op expr1 Minus expr2) variables = evaluateExpression expr1 variables - (evaluateExpression expr2 variables)
evaluateExpression (Op expr1 Div expr2) variables   = evaluateExpression expr1 variables `div` (evaluateExpression expr2 variables)
evaluateExpression (Op expr1 Mult expr2) variables  = evaluateExpression expr1 variables * (evaluateExpression expr2 variables)
evaluateExpression (Op expr1 Mod expr2) variables   = evaluateExpression expr1 variables `mod` (evaluateExpression expr2 variables)

evaluateExpression (Op expr1 Gt expr2) variables | evaluateExpression expr1 variables > (evaluateExpression expr2 variables) = 1
                                                 | otherwise = 0
evaluateExpression (Op expr1 Ge expr2) variables | evaluateExpression expr1 variables >= (evaluateExpression expr2 variables) = 1
                                                 | otherwise = 0
evaluateExpression (Op expr1 Lt expr2) variables | evaluateExpression expr1 variables < (evaluateExpression expr2 variables) = 1
                                                 | otherwise = 0
evaluateExpression (Op expr1 Le expr2) variables | evaluateExpression expr1 variables <= (evaluateExpression expr2 variables) = 1
                                                 | otherwise = 0
evaluateExpression (Op expr1 Eq expr2) variables | evaluateExpression expr1 variables == (evaluateExpression expr2 variables) = 1
                                                 | otherwise = 0


executeStatement :: State -> State
executeStatement (State (Assign var expr:xs) variables) = executeStatement (State xs updatedVariables)
                                                          where updatedVariables = Map.insert var (evaluateExpression expr variables) variables
executeStatement (State (Incr var:xs) variables)        = executeStatement (State xs updatedVariables)
                                                          where updatedVariables = Map.update incrementFunction var variables
                                                                incrementFunction x = Just (x + 1)
executeStatement (State (Decr var:xs) variables)        = executeStatement (State xs updatedVariables)
                                                          where updatedVariables = Map.update decrementFunction var variables
                                                                decrementFunction x = Just (x - 1)

executeStatement state@(State (If condition statement:xs) variables) | evaluateExpression condition variables == 0 = executeStatement (State xs variables)
                                                                     | otherwise = executeStatement (State xs updatedVariables)
                                                                                     where State _ updatedVariables = executeStatement (State [statement] variables)
executeStatement (State (For initialzation condition afterthought body:xs) variables) = executeStatement (State xs updatedVariables)
                                                                                        where State _ initVariables = executeStatement (State [initialzation] variables)
                                                                                              loopStatements = [body, afterthought]
                                                                                              updatedVariables = loop initVariables
                                                                                              loop variables | evaluateExpression condition variables == 0 = variables
                                                                                                             | otherwise = loop updateVariables
                                                                                                                           where State _ updateVariables = executeStatement (State loopStatements variables)
executeStatement state@(State [] variables) = state

-- Program execution --
instructions = [Assign "sum" (Val 0),
                For (Assign "i" (Val 0)) (Op (Var "i") Lt (Val 10)) (Incr "i")
                (Assign "sum" (Op (Var "sum") Plus (Var "i")))]

result = executeStatement (State instructions Map.empty)
module Parser where


import Control.Applicative
import qualified Control.Arrow as A (first)
-- first (+7) (35, 0) -> (42, 0)


newtype Parser a =
  Parser { parse :: String -> Maybe (a, String) }


instance Functor Parser where
  fmap f (Parser p) = undefined

instance Applicative Parser where
  pure  = undefined
  (<*>) = undefined

satisfy :: (Char -> Bool) -> Parser Char
satisfy = undefined

char :: Char -> Parser Char
char = undefined

openingBrace :: Parser Char
openingBrace = undefined

closingBrace :: Parser Char
closingBrace = undefined

inBraces :: Parser a -> Parser a
inBraces p = openingBrace *> p <* closingBrace


instance Alternative Parser where
  empty = undefined
  (<|>) = undefined

oneOrMore, zeroOrMore  :: Parser a -> Parser [a]
oneOrMore = undefined

zeroOrMore = undefined

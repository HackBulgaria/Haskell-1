module Parser where


import Control.Applicative
import Control.Arrow (first)
-- first f (x, y) -> (f x, y)

newtype Parser a =
  Parser { parse :: String -> Maybe (a, String) }

instance Functor Parser where
  fmap f (Parser p) = Parser $ \s -> first f <$> p s

instance Applicative Parser where
  pure a = Parser $ Just . (,) a
  Parser p <*> Parser k
    = Parser $ \s -> case p s of
                     Just (f, s') -> first f <$> k s'
                     Nothing      -> Nothing

satisfy :: (Char -> Bool) -> Parser Char
satisfy p = Parser $ \s -> case s of
                           (c:cs) -> if p c then Just (c, cs)
                                            else Nothing
                           _      -> Nothing

char :: Char -> Parser Char
char = satisfy . (==)

openingBrace :: Parser Char
openingBrace = char '('

closingBrace :: Parser Char
closingBrace = char ')'

inBraces :: Parser a -> Parser a
inBraces p = openingBrace *> p <* closingBrace

oneOrMore, zeroOrMore  :: Parser a -> Parser [a]
oneOrMore p = liftA2 (:) p $ zeroOrMore p

instance Alternative Parser where
  empty = Parser $ \s -> Nothing
  Parser f <|> Parser g
    = Parser $ \s -> case f s of
                     Nothing -> g s
                     Just (c, cs) -> Just (c, cs)

zeroOrMore p = oneOrMore p <|> pure []

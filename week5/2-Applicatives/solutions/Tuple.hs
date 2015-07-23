data Tuple a b = Tuple a b
  deriving (Show)

instance Functor (Tuple a) where
  fmap f (Tuple x y) = Tuple x $ f y

-- instance Functor ((,) a) where
--   fmap f ((,) x y) = (,) x $ fy
--   or:
--   fmap f (x, y)    = (x, f y)

data Pair a = Pair a a
  deriving (Show)

instance Functor Pair where
  fmap f (Pair x y) = Pair (f x) (f y)

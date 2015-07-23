data BTree a = Node a (BTree a) (BTree a) | Leaf a | Nil
  deriving (Show)

treeMap :: (a -> b) -> BTree a -> BTree b
treeMap f (Node v l r) = Node (f v) (treeMap f l) (treeMap f r)
treeMap f (Leaf v)     = Leaf $ f v
treeMap _ _            = Nil

instance Functor BTree where
  fmap = treeMap

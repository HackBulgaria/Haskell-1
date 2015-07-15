module Render where

import Data.Complex (Complex(..))
import Fractals (maxIterations, Fractal)
import Codec.Picture (PixelRGB8(..))


-- Returning a coloured pixel for a given pixel's coordinates
-- and a fractal function
render :: Fractal -> Int -> Int -> PixelRGB8
render fractal x y = pickColour $ fractal x y

-- Returning a coloured pixel for a number of iterations
-- (You can experiment with the values to get different images)
pickColour :: Int -> PixelRGB8
pickColour iter = PixelRGB8 r g b
  where (r, g, b) | iter > maxIterations = (255, 255, 255)
                  | otherwise            = (iter'*2, iter', iter')
        iter' = fromIntegral iter

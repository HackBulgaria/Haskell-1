module Main where

import Render (render)
import Fractals (drawMandelbrot, screen)
import Codec.Picture (writePng, generateImage)


-- Impure code!
-- The drawing of the png image happens here
main :: IO ()
main = writePng "fractal.png" $
-- Replace drawMandelbrot with the drawing function for the fractal
-- which you want to visualise
  generateImage (render drawMandelbrot) (fst screen) (snd screen)

## Let's draw some fractals!

#### Notes:

There are some modules already written (Main and Render),
but you'll have to implement some funcions for the Fractals module in
order to run the whole thing!

### the `window`

Nothing too hard here.
You only have to specify top left and bottom right points.
Play with the values, but here are some default ones to see the whole fractal:
* Mandelbrot      -> -1.9, 1.3 and 0.7, -1.3
* Julia set       -> -1.5, 1.5 and 1.5, -1.5
* Newton's method -> -2.0, 2.0 and 2.0, -2.0

### `pixelToCoordinate`

You should map every pixel from the screen to a coordinate in the plane.

```
screen -> (600, 600)

pixelToCoordinate 0 0 ((-1.0, 1.0), (-1.0, 1.0)) -> (-1.0, -1.0)
pixelToCoordinate 300 300 ((-1.0, 1.0), (-1.0, 1.0)) -> (0.0, 0.0)
```

### Now implement the formula for `mandelbrot`!

### If you wish, you can implement `julia`, `drawJulia`, `newton` and `drawNewton`

-- stack --resolver lts-2.9 --install-ghc runghc --package turtle
import Turtle

main = do
    dir  <- pwd
    time <- datefile dir
    print time

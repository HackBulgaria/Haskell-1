{-# LANGUAGE TypeFamilies, QuasiQuotes, TemplateHaskell, OverloadedStrings #-}
import Yesod

data App = App

instance Yesod App

mkYesod "App" [parseRoutes| / HomeR  GET |]

getHomeR = defaultLayout $ [whamlet| <p> Hello World! |]

main :: IO ()
main = warpEnv App
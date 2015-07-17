# Functional programming - week 5

[Day 1](./README.md#day-1)

[Day 2](./README.md#day-2)
 
## Day 1

### Web Haskell

#### Stackage

It is an index of mutually stable library versions in [Hackage](http://hackage.haskell.org/). 
It is created automatically with building and testing different version of libraries from [Hackage](http://hackage.haskell.org/) on many operating systems. 
Index description is kept in a single file [cabal.config](https://www.stackage.org/lts/cabal.config) which should be put along with cabal file in same folder.

#### DSL

DSL = Domain Specific Language
They are used to constrain operations to certain well defined and tested set. DSLs are usually easier to read and modify even by non-programmers. They are easier to test and proof, because of the constrained domain.
In Haskell it is easy to make DSL and they are widely used.

#### TemplateHaskell, QuasiQuotations and ChichkoviteChervenotikvenovcheta

[QuasiQuotations](https://wiki.haskell.org/Quasiquotation) - a GHC extension for embedding DSLs (EDSL) inside Haskell code
[TemplateHaskell](https://wiki.haskell.org/Template_Haskell) - a GHC extension for type-safe compile-time meta programming
ChichkoviteChervenotikvenovcheta - extension for testing your speak skills

#### Shakespearean templates

[They](http://www.yesodweb.com/book/shakespearean-templates) are type-safe EDSL for HTML, CSS and JavaScript description. Coming from Yesod framework.

#### FP Complete

Cloud based IDE for Haskell - [www.fpcomplete.com](https://www.fpcomplete.com)

#### Simple example

```haskell
{-# LANGUAGE TypeFamilies, QuasiQuotes, TemplateHaskell, OverloadedStrings #-}
module Main where

import Yesod

data App = App

instance Yesod App

mkYesod "App" [parseRoutes| / HomeR  GET |]

getWorldR = defaultLayout $ [whamlet| <p> Hello World! |]

main :: IO ()
main = warp 3000 App
```

Can also be found here:  https://www.fpcomplete.com/user/varosi/minimalistic-yesod-server

#### cabal install

Note that it could take 15min on Core i7 first time for Yesod libraries to build. And it is good to use GHC >=7.8.x and cabal >= 1.18.

1. wget https://www.stackage.org/lts/cabal.config
2. cabal update
3. cabal sandbox init
4. cabal install

#### Preparation

You'll need your code about fractals image generation.

Search help install:

* [Hoogle](https://www.haskell.org/hoogle/)
* [Hayoo!](http://hayoo.fh-wedel.de)

#### Tasks

1. Make basic example run
2. Modify basic example say "Hey, " and your name answering on /hey/#String
3. Show Mandelbrot fractal on /mandelbrot
4. Pass fractal image size on URL

#### Helping snippet

```haskell
getHelloR :: MonadHandler m => m TypedContent
getHelloR = sendResponse $ toTypedContent (typePlain, toContent "Say Haskell!")
```

"Say Haskell!" string may be changed with anything that is ByteString.

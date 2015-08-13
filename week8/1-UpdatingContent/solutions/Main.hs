module Main where


import Network.HTTP.Conduit (simpleHttp)
import Data.List ((\\))
import Text.StringLike
import Text.HTML.TagSoup
import qualified Data.ByteString.Lazy.Char8 as L
import System.Environment (getArgs)
import System.IO.Error (tryIOError)


-- The website containing information about our book
leanpub :: String
leanpub = "http://leanpub.com/gameinhaskell"

-- Keeping it generic, because we may want to
-- use something other than a Lazy ByteString
type ParsedPageContent str = [Tag str]

-- Getting a list of the tags between an 'open' and a 'close' tag
contentWithinTags :: (TagRep t, StringLike str) => t -> t -> ParsedPageContent str -> ParsedPageContent str
contentWithinTags open close = takeWhile (~/= close) . dropWhile (~/= open)

textWithinTags :: (TagRep t, StringLike str) => t -> t -> ParsedPageContent str -> str
textWithinTags open close = innerText . contentWithinTags open close

isBookComplete :: ParsedPageContent L.ByteString -> Bool
isBookComplete content = emText /= L.pack "Note: this book is in progress"
  where divContent = contentWithinTags "<div class=cms-content>" "</div>" content
        emText     = textWithinTags "<em>" "</em>" divContent

getTOC :: StringLike str => ParsedPageContent str -> str
getTOC = textWithinTags "<div class=toc>" "</div>"

-- Removing leading spaces and empty lines from the TOC
formatTOC :: L.ByteString -> L.ByteString
formatTOC = L.unlines . filter (/= L.empty) . trimLeadingSpaces
  where trimLeadingSpaces = map (L.pack . dropWhile (`elem` ['\n', '\t', ' ']). L.unpack) . L.lines


-- Impure code starts here!
getParsedContent :: String -> IO (ParsedPageContent L.ByteString)
getParsedContent = fmap parseTags . simpleHttp


main :: IO ()
main = do
  content <- getParsedContent leanpub

  if isBookComplete content
  then putStrLn "The book is complete!"
  else putStrLn "The book is still not complete."

  oldTOC <- (tryIOError $ L.readFile "toc") >>=
              \s -> return $ case s of
                             Left  err -> L.empty 
                             Right toc -> toc

  let newTOC = formatTOC $ getTOC content

  let diff = L.lines newTOC \\ L.lines oldTOC

  if null diff
  then putStrLn "There aren't any new chapters."
  else putStrLn "There are some new chapters available!\n"

  mapM_ L.putStrLn diff

  L.writeFile "toc" newTOC

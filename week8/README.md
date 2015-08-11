# Last week!

[Day 1](./README.md#day-1)

[Day 2](./README.md#day-2)
 
## Day 1

### [Stack](https://www.fpcomplete.com/blog/2015/06/stack-0-1-release)

### HTTP requests and HTML parsing

#### Making HTTP requests in Haskell

There are many libraries allowing us to do this.

We will use `http-conduit`.

simpleHttp :: String -> IO ByteString

```haskell
-- As simple as that.
haskellOrgsContent :: IO ByteString
haskellOrgsContent = simpleHttp "http://haskell.org"
```

#### Parsing HTML

Again, there are many possibilities here.

Some of them are:
* [html-conduit](https://hackage.haskell.org/package/html-conduit)
* [tagsoup](https://hackage.haskell.org/package/tagsoup)
* [hxt](http://hackage.haskell.org/package/hxt-9.3.1.15)

We will use `tagsoup`, because it's simplest and, more importantly, works with malformed `html`, which occurrs pretty often in the web, because the pages are mostly written by humans.

* Parsing tags

```haskell
-- A single HTML element. A whole document is represented by a list of Tag.
-- There is no requirement for TagOpen and TagClose to match.
-- Note: I haven't mention all of the constructors, but these here should be enough.
data Tag str = TagOpen str [Attribute str] 
             | TagClose str    
             | TagText str

parseTags :: StringLike str => str -> [Tag str]
```

```
> parseTags "<div class=the-div>42</div>"
[TagOpen "div" [("class","the-div")],TagText "42",TagClose "div"]

```

* Comparing Tags

```haskell
(~==), (~/=) :: (StringLike str) => Tag str -> t -> Bool
```

```
> let tag = head . parseTags $ "<div class=the-div>42</div>"
> tag ~== TagOpen "div" []
True
> tag ~== TagOpen "div" [("class", "the-div")]
True
> tag ~== TagOpen "div" [("class", "div")]
False
> tag ~== "<div>"
True
> tag ~== "<div class=the-div>"
True
> tag ~== "<div class=div>"
False
> tag ~== TagOpen "" []
True
```

* But how to use that?

```haskell
content = simpleHttp url

-- Not Safe! (why?)
fstDivContent = takeWhile (~/= "</div>") . tail . dropWhile (~/= "<div>")

--Extract all text content from tags
innerText :: StringLike str => [Tag str] -> str
```

```haskell
-- For example:
> innerText . fstDivContent . parseTags $ "<div class=the-div>42</div>"
"42"
```

Now go on with the [task](./1-UpdatingContent/README.md)

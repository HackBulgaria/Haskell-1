## Type classes!

### 01. The Dionom
#### Define a type class named Dionom, which should have the following behaviour:
* `dempty` - a Dionom should have an unit value
* `dappend` - you could `dappend` two Dionoms and receive a Dionom as a result
* `dconcat` - you could reduce a list of Dionoms to a single Dionom

Note: Maybe we can provide a default implementation for some of the functions?

### 02. Which Dionom types come to your mind? Implement Dionom instances for these types!

### 03. Faster Lists 
##### Implement a List, which should have the following interface:

```haskell
-- i is the index type, while a is the value type in the list
data List i a = Append i (List i a) (List i a) | Entry a | Nil
```

* adding a new entry
* getting an entry on an index should be faster than linear
* removing an entry on an index should be faster than linear
* displaying the list in a pretty way (the interpretation of `pretty` here is up to you!)
* appending two lists
* converting it to a normal list
* droping and taking the first `n` elements
* folding it

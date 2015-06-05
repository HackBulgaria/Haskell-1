# Is the given word from the language?

Thanks to your help, Hass has arrived just on time to meet his friends.

Now they will be playing the following game:

One person defines a language by a string like `a^nb^n...z^n` - the characters from `[a-z]` followed by the symbols `^n`.

Given a random word, the others should guess if it's in the above language or not.

Help Hass to win the game by guessing faster than the others!

### Explanations:
* `a^nb^n` means that any word in that language must begin with any character repeated `x` times, and it should be followed by a different character repeated `x` times exactly.


## Examples:

```
Input:
a^nb^n
1122
Output:
yes
```
```
Input:
a^nb^n
aabb
Output:
yes
```
```
Input:
a^nb^nc^n
abb
Output:
no
```
```
Input:
a^nb^nc^n
aabbcc
Output:
yes
```

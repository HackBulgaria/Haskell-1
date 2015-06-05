# Name matching!

Now Hass is back home. He has met some new acquaintances, but the problem is that he has an awful memory when it comes to remembering names.

The good thing is that he knows all the names of the people who were there.

So, he wrote a list with all the names and also the names (male and female) which he can match with people.

Can you guess what the chance is for Hass to not mistake any of the names the next time he meets with the cats? 

* All of the male names end with `-ss` while the female ones end with `-tta`.

## Examples
```
Input:
1 1
Vetta Tess Lejetta
Output:
100%
```
### Explanation:
He knows one male and one female name, so the only one remaining is one female name, which means that he won't make a mistake.
```
Input:
1 0
Jass Julietta Frass Qetta
Output:
50%
```
### Explanation:
He knows only one male name, but there are two male and two female names. He knows the names of the boys, but there is
a 50% chance to mistake the names of the girls.

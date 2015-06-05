# Name matching!

Hass is now back home. He has met some new acquaintances, but the problem is that he has an awful memory when it comes to remembering names.

The good thing is that he knows all of the names of the people who were there.

So, he wrote on a list the number of names (male and female) which he can match with people and, also, all the names.

Can you guess what is the chance for Hass to not mistake any of the names the next time he meets with the cats? 

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
He knows one male and one female name, so there remains only one female name, which means that he won't mistake anything.
```
Input:
1 0
Jass Julietta Frass Qetta
Output:
50%
```
### Explanation:
He knows only one male name, but there two male and two female names. He knows the names of the boys, but there is
a 50% chance to mistake the names of the girls.

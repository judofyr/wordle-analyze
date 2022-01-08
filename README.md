# Wordle analysis

Everyone is playing [Wordle](https://www.powerlanguage.co.uk/wordle/) these days so obviously we need to analyze!

**Warning:** Don't look too carefully in `words.json` as this will spoil the answer to future puzzles.

## Best first word

```
Summary:
  raise (worst case leads to 168 possible answers)
  arise (worst case leads to 168 possible answers)
  alone (worst case leads to 182 possible answers)
  arose (worst case leads to 183 possible answers)
  atone (worst case leads to 191 possible answers)
  ratio (worst case leads to 192 possible answers)
  irate (worst case leads to 194 possible answers)
  alter (worst case leads to 196 possible answers)
  alert (worst case leads to 196 possible answers)
  aisle (worst case leads to 196 possible answers)
  later (worst case leads to 196 possible answers)
  teary (worst case leads to 198 possible answers)
  leant (worst case leads to 208 possible answers)
  renal (worst case leads to 212 possible answers)
  learn (worst case leads to 212 possible answers)
```

What's the best first word?
It's not necessarily about matching most possible words, but it's about _eliminating_ possible answers.
"fuzzy" is a terrible first word because in most cases you'll get five gray letters.
In comparison, with "raise", regardless of what you'll get back, there will never be more than 168 possible answers.

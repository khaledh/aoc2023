import std/strutils

const
  NumWords = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

var answer: int

# read lines from file
for line in lines("a.txt"):
  var firstDigit, lastDigit: char = '\0'
  var firstWord, lastWord: int = 0

  for i, ch in line.pairs:
    # track first and last digit
    if isDigit(ch):
      if firstDigit == '\0' and firstWord == 0:
        firstDigit = ch
      lastWord = 0
      lastDigit = ch

    for n, numword in NumWords.pairs:
      # track first and last word
      if line.substr(i, i + numword.len - 1) == numword:
        if firstDigit == '\0' and firstWord == 0:
          firstWord = n + 1
        lastDigit = '\0'
        lastWord = n + 1
        break

  let first = if firstWord == 0: $firstDigit else: $firstWord
  let last = if lastWord == 0: $lastDigit else: $lastWord

  # convert to int and add to answer
  var num = parseInt(first & last)
  answer += num

echo answer

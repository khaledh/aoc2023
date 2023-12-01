import std/strutils

var answer: int

# read lines from file
for line in lines("a.txt"):
  var first, last: char = '\0'
  for c in line:
    # track first and last digit
    if first == '\0' and isDigit(c):
      first = c
    if isDigit(c):
      last = c
  # convert to int and add to answer
  var i = parseInt(first & last)
  answer += i

echo answer

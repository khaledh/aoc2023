import std/[sequtils, strutils, sugar]

type
  CubeSet = object
    red: int
    green: int
    blue: int

  Game = object
    id: int
    sets: seq[CubeSet]

# line format:
# Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green

proc parse(line: string): Game =
  var parts = line.split(": ")
  var id = parts[0]
  var sets = parts[1].split("; ")

  result.id = parseInt(id[5..high(id)])

  for set in sets:
    var cubes = set.split(", ")
    var cubeSet: CubeSet
    for cube in cubes:
      var parts = cube.split(" ")
      var color = parts[1]
      var count = parseInt(parts[0])
      case color
      of "red":
        cubeSet.red = count
      of "green":
        cubeSet.green = count
      of "blue":
        cubeSet.blue = count
      else:
        raise newException(ValueError, "Unknown color: " & color)
    result.sets.add(cubeSet)

var gameIdTotal = 0

for line in lines("input.txt"):
  var game = parse(line)
  if any(game.sets, s => s.red > 12 or s.green > 13 or s.blue > 14):
    continue
  inc gameIdTotal, game.id

echo gameIdTotal

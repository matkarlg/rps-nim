from random import rand, randomize
from strutils import parseEnum

type Choice {.pure.} = enum Rock, Paper, Scissors

proc readEnum[T](): T =
  while true:
    try:
      return parseEnum[T](readLine(stdin))
    except ValueError:
      echo "Bad move, try again."

while true:
  # Seed random number generator
  randomize()

  # Computer picks
  let rand_range = ord(low(Choice))..ord(high(Choice));
  let computer = Choice(rand(rand_range))

  # Get validated player input
  echo "Your move: "
  let player = readEnum[Choice]()

  # Calculate winner
  case (3 + ord(computer) - ord(player)) mod 3
  of 1:
    echo "Computer Wins!"
  of 2:
    echo "You Win!"
  else:
    echo "Tie, replay!"

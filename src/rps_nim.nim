from random import rand, randomize
from strutils import parseEnum
import gara

type Choice {.pure.} = enum Rock, Paper, Scissors
const choiceRange = ord(low(Choice))..ord(high(Choice))

proc readEnum[T](): T =
  while true:
    try:
      return parseEnum[T](readLine(stdin))
    except ValueError:
      echo "Bad move, try again."

while true:
  # Seed random number generator
  randomize()

  # Random computer choice
  let computer = Choice(rand(choiceRange))

  # Get validated player input
  echo "Your move: "
  let player = readEnum[Choice]()

  # Calculate winner
  match((player, computer)):
    (Choice.Paper, Choice.Rock) or
    (Choice.Scissors, Choice.Paper) or
    (Choice.Rock, Choice.Scissors):
      echo "You Win!"
    _ and player == computer:
      echo "Tie, replay!"
    _:
      echo "Computer Wins!"

  # Or without gara pattern matching

  # case (3 + ord(computer) - ord(player)) mod 3
  # of 1:
  #   echo "Computer Wins!"
  # of 2:
  #   echo "You Win!"
  # else:
  #   echo "Tie, replay!"

# Battleship
![Battleship](https://github.com/elyhess/battleship/blob/main/battleship.png)
***
    How to play:
- Open terminal
- Move/CD to the battleship directory
- In your Terminal, type in `ruby runner.rb`

***
    How it works:
- ship
  + A ship object holds information about its length, health, and name.
- cell
  * A Cell object can contain a ship. A cell has coordinates, and can render its status as: `.`, `M`, `H`,`X`, or `S`
- board
  * A board is a container that consists of Cell objects. The validation for ship placement and hit placement happens here.
- player
  * The player class is responsible for handling player inputs. The user inputs are run against the validation methods used in the board class.
- computer
  * The computer class utilizes randomization to produce coordinates for ship placement, and hit placement - both of which run against validation methods used in the board class.
- game
  * The game class defines the phases of the game.

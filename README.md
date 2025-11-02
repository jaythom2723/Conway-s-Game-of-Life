# Conway's Game of Life
A recreation of conway's game of life in lua with love2d. A relatively simple project with simple controls.

[!](https://raw.githubusercontent.com/jaythom2723/Conway-s-Game-of-Life/main/preview.mp4)

## Installation
Download the latest release and extract the zip file anywhere on your computer.
Works cross-platform for Linux + Windows, unsure of Mac

## Controls
R - Reset

ESC - Exit

# What is Game of Life?
Game of Life is a computer simulation created and invented by British Mathematician [John Horton Conway](https://en.wikipedia.org/wiki/John_Horton_Conway). The game itself is a zero-player game, meaning the evolution of the game state is determined by its initial state.

Game of Life is a [cellular automaton](https://en.wikipedia.org/wiki/Cellular_automaton) that *is* turing complete and can simulate a [universal constructor](https://en.wikipedia.org/wiki/Von_Neumann_universal_constructor) or any other [Turing Machine](https://en.wikipedia.org/wiki/Turing_machine)

## Rules
This implementation of Conway's Game of Life is a 100x75 grid of cells with two possible states, alive or dead. Each cell interacts with its neighbors and the number of live and dead neighbors determine the final state of a cell at the end of the cycle.

The following rules describe how a cell can come to live and die during the simulation:
 1. A live cell with fewer than two live neighbors dies.
 2. A live cell with two or three live neighbors stays alive.
 3. A live cell with more than three live neighbors dies.
 4. A dead cell with three live neighbors becomes alive.

Normally, a person would be able to control the initial state of the simulation. However, for ease of simplicity, the initial state is randomized each reset. A cell has a 5% chance of being alive at the start of a new simulation.

If the pattern goes to the left or right of the screen, it will loop over to the opposing side.
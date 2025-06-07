
# Peg Reversal Game

## Overview

The Peg Reversal Game is a strategic board game implemented in Haskell. The objective is to reverse the positions of the pegs on the board through a series of valid moves. This project showcases functional programming principles and provides an engaging way to explore game theory concepts.

---

## Features

- **Game Mechanics**
  - Players can move pegs according to specific rules.
  - The game supports both single-player and multiplayer modes.
  
- **User Interface**
  - A simple command-line interface for interaction.
  - Clear instructions and feedback for each move.

- **Game Logic**
  - Validations to ensure moves comply with game rules.
  - Automatic detection of win conditions.

---

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yomnaelgohary/Peg-Reversal-Game-in-Haskell.git
   ```

2. Navigate to the project directory:
   ```bash
   cd Peg-Reversal-Game-in-Haskell
   ```

3. Ensure you have GHC (Glasgow Haskell Compiler) installed. You can download it from Haskell's official site.

4. Install the necessary dependencies using Cabal:
   ```bash
   cabal update
   cabal install
   ```

---

## Usage

To run the game, execute the following command in the project directory:

```bash
cabal run
```

Follow the on-screen instructions to start playing. You can choose your game mode and make moves by entering the corresponding commands.

---

## Game Rules

- Players take turns moving pegs.
- A peg can jump over an adjacent peg into an empty space.
- The goal is to reverse the initial configuration of the pegs.



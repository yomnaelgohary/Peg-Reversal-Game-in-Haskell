type Position = (Int, Int)
data Color = W | B deriving (Eq, Show)
data Peg = Peg Position Color deriving (Eq, Show)
data Move = M Position deriving (Eq, Show)
type Board = [Peg]
data State = S Move Board deriving (Eq, Show)

createBoard :: Position -> Board
createBoard pos = if not (isValidPosition pos) then error "The Position is not valid."  else addPegs allPositions
  where
    addPegs [] = []
    addPegs (p:ps) = Peg p (if p == pos then W else B) : addPegs ps
  
isValidPosition :: Position -> Bool
isValidPosition pos = elem pos allPositions


allPositions :: [Position]
allPositions = [(-3, -1), (-3, 0), (-3, 1),(-2, -1), (-2, 0), (-2, 1),(-1, -3), (-1, -2), (-1, -1), (-1, 0), (-1, 1), (-1, 2), (-1, 3),(0, -3), (0, -2), (0, -1), (0, 0), (0, 1), (0, 2), (0, 3),(1, -3), (1, -2), (1, -1), (1, 0), (1, 1), (1, 2), (1, 3),(2, -1), (2, 0), (2, 1),(3, -1), (3, 0), (3, 1)]
  
isValidMove :: Move -> Board -> Bool
isValidMove (M pos) board = isBlackPeg pos board && hasAdjacentWhite pos board

isBlackPeg :: Position -> Board -> Bool
isBlackPeg pos [] = False
isBlackPeg pos (Peg p color : rest) =
  if p == pos && color == B then True else isBlackPeg pos rest

isWhitePeg :: Position -> Board -> Bool
isWhitePeg pos [] = False
isWhitePeg pos (Peg p color : rest) =
  if p == pos && color == W then True else isWhitePeg pos rest   
  
hasAdjacentWhite :: Position -> Board -> Bool
hasAdjacentWhite (x, y) board =
  isWhitePeg (x-1, y) board || isWhitePeg (x+1, y) board || isWhitePeg (x, y-1) board || isWhitePeg (x, y+1) board

isGoal [] = True
isGoal(Peg p color : rest)=if color==W then isGoal rest 
                        else False
						
applyMove :: Move -> Board -> Board
applyMove (M pos) board = updateBoard pos board
  where
    updateBoard _ [] = []
    updateBoard pos (Peg p c : rest) = Peg p (if p == pos then W else c) : updateBoard pos rest

showPossibleNextStates :: Board -> [State]
showPossibleNextStates board
  | helperResult == [] = error "No Possible States Exist"
  | isGoal board = error "The board is already in a winning state."
  | otherwise = helperResult
  where
    helperResult = helper allPositions board

helper :: [Position] -> Board -> [State]
helper [] _ = []
helper (pos:rest) board = if isValidMove (M pos) board  then S (M pos) (applyMove (M pos) board) : helper rest board
                         else  helper rest board						
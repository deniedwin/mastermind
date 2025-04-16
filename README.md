# mastermind
the game will be run as player vs computer

q1: what are the main things (objects) involved with the mastermind game?
a: game, board, players

q2: what responsabilities should each object have?
a: 
game: run the game loop, manage the players, determine winner
board: state of the game, display the board, update the board, check for victory
players: store player info (codemaker or codebreaker), make a move, secret code

q3: what data does each object keep track?
a:
game: @player, @board, @turns
board: @state
players: @id, @code

q4: how should the objects talk to each other?
a:
game: creates board and players
game: tells player to make a move
player: interacts with the board
board: checks for win and tells game if won

q5: what is the step by step flow of the game?
a:
board draws the board.
game tells player to make a move
player makes a move
board update
board checks if move results in win
player update pegs (hints)
game announce win or next turn

q6: what are the key methods of each class?
a:
game: start_game, play_turn, announce_winner
board: draw_board, update, won?, valid_move?, update_board
player: make_move

q7: how do i handle turns and win conditions?
a: after each move. if the player move was the same as secret code then game is won.
after an amount of turns if game is not won, then player lost.

# update above on 17-04-2025
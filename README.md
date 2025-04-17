# mastermind
the game will be run as player vs computer

q1: what are the main things (objects) involved with the mastermind game?
a: game, board, players

q2: what responsabilities should each object have?
a: 
game: run the game loop, manage players
board: display the board, update the board
player: role (code_maker or code_breaker) code_maker and code_breaker inherit class player
judge: compare codebreaker to code, give feedback to player, determine winner

q3: what data does each object keep track?
a:
game: @player, @board, @max_turns
board: @state, @history = {guess: [r,g,b,y], pegs: [b,w]}
player: @id, @role, @code, @guess
judge: -

q4: how should the objects talk to each other?
a:
game: creates board and players
game: tells player to make a move
player: interacts with the board
board: draw board (and feedback) and record turns

q5: what is the step by step flow of the game?
a:
begin
game start
game create players + board
player codemaker sets secret code
game loop max 12 turns
board display history
player codebreaker makes guess
judge compares guess and secret code
judge feedback pegs
board record turn + pegs
judge win? if yes -> announce winner
judge win? (4 black pegs) if no -> max turns? -> if no -> turn += 1, loop again
max turns? -> if yes -> announce loss
end

q6: what are the key methods of each class?
a:
game: start_game, announce_winner
board: draw_board, record_turn
player codemaker: make_code
player codebreaker: make_guess
judge: check_code(current_guess, secret_code), valid_move?, won?

q7: how do i handle turns and win conditions?
a: after each move. if the player move was the same as secret code then game is won.
after an amount of turns if game is not won, then player lost.
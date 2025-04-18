# class in charge of the flow of the app
class Game
  def start_game
    puts 'start game'
    max_turns = 3
    code_maker = CodeMaker.new(1)
    code_breaker = CodeBreaker.new(2)
    judge = Judge.new
    board = Board.new
    code = code_maker.make_code
    won = false

    max_turns.times do
      board.draw_board
      guess = code_breaker.make_guess

      if judge.valid_move?(guess)
        feedback = judge.check_code(guess, code)
        board.record_turn(guess, feedback)
        puts '------------'
        if judge.win?(feedback)
          board.announce_winner(code_breaker)
          won = true
          break
        end
      end
    end
    board.announce_loss unless won

  end
end

# class in charge of player id
class Player
  attr_reader :id
  def initialize(id)
    @id = id
  end
end

# class player that makes the secret code
class CodeMaker < Player
  def make_code
    ['r', 'g', 'b', 'y']
  end
end

# class player that guesses the secret code
class CodeBreaker < Player
  def make_guess
    ['r', 'g', 'b', 'w']
  end
end

# class that checks if the guess is equal to secret code
class Judge
  def check_code(guess, code)
    if guess == code
      {black: 4, white: 0}
    else
      {black: 0, white: 0}
    end
  end

  def win?(feedback)
    feedback[:black] == 4
  end

  def valid_move?(guess)
    guess.include?('r' && 'g' && 'b' && 'w')
  end
end

# class that draws the board, record turns and announce win/loss
class Board
  def initialize()
    @history = []
  end

  def draw_board
    puts "board = #{@history}"
  end

  def record_turn(guess, feedback)
    @history.push({guess: guess, feedback: feedback})
    puts 'player turn recorded'
  end

  def announce_winner(code_breaker)
    puts "winner = #{code_breaker}"
  end

  def announce_loss
    puts 'loss'
  end

  def current_turn
    @history.size
  end
end

mastermind = Game.new
mastermind.start_game
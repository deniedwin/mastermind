class Game
  def start_game
    puts 'start game'
  end
end

class Player
  attr_reader :id, :maker
end

class CodeMaker < Player
  def set_secret_code
    puts 'set a new code'
  end
end

class CodeBreaker < Player
  def make_guess
    puts 'try a new guess'
  end
end

class Judge
  def check_code(guess, code)
    puts 'checking gues with code'
  end
end

class Board
  def draw_board
    puts 'draw board'
  end
  def record_turn
    puts 'player turn recorded'
  end
end

mastermind = Game.new
mastermind.start_game
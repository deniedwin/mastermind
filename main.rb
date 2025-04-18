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
      feedback = judge.check_code(guess, code)
      board.record_turn(guess, feedback)
      puts '---------------------'

      if judge.win?(feedback)
        board.announce_winner(guess)
        won = true
        break
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
    ['y', 'g', 'r', 'b']
  end
end

# class player that guesses the secret code
class CodeBreaker < Player
  VALID_COLORS = ['r', 'g', 'b', 'y']

  def make_guess
    puts 'enter your guess (4 colors: r g b y), seperated by space'
    loop do
      input = gets.chomp.split
      if valid_guess?(input)
        return input
      else
        puts 'invalid guess'
      end
    end
  end

  def valid_guess?(guess)
    guess.size == 4 && guess.all? {|color| VALID_COLORS.include?(color)}
  end

end

# class that checks if the guess is equal to secret code
class Judge
  def check_code(guess, code)
    black_pegs = 0
    white_pegs = 0
    used_guess_indices = []
    used_code_indices = []

    # check for black pegs
    guess.each_with_index do |color, i|
      if color == code[i]
        black_pegs += 1
        used_code_indices.push(i)
        used_guess_indices.push(i)
      end
    end

    # check for white pegs
    guess.each_with_index do |color_guess, i|
      if !used_guess_indices.include?(i)
        code.each_with_index do |color_code, j|
          if !used_code_indices.include?(j) && color_guess == color_code
            white_pegs += 1
            used_code_indices.push(j)
            break
          end
        end
      end
    end

    {black: black_pegs, white: white_pegs}
  end

  def win?(feedback)
    feedback[:black] == 4
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

  def announce_winner(guess)
    puts "winner guess = #{guess}"
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
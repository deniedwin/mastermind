# frozen_string_literal: true

# class in charge of the flow of the app
class Game
  def start_game
    setup_game
    play_rounds
    announce_result
  end

  def setup_game
    @max_turns = 3
    @code_maker = CodeMaker.new(1)
    @code_breaker = CodeBreaker.new(2)
    @judge = Judge.new
    @board = Board.new
    @code = @code_maker.make_code
    @won = false
    puts 'start game'
  end

  def play_rounds
    @max_turns.times do
      @board.draw_board
      guess = @code_breaker.make_guess
      feedback = @judge.check_code(guess, @code)
      @board.record_turn(guess, feedback)
      next unless @judge.win?(feedback)

      @board.announce_winner(guess)
      @won = true
      break
    end
  end

  def announce_result
    @board.announce_loss unless @won
  end
end

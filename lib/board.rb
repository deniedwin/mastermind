# frozen_string_literal: true

# class that draws the board, record turns and announce win/loss
class Board
  def initialize
    @history = []
  end

  def draw_board
    puts 'Board:'
    @history.each_with_index do |turn, index|
      puts "Turn #{index + 1}: Guess: #{turn[:guess].join(' ')}"
      puts "Feedback: B:#{turn[:feedback][:black]} W:#{turn[:feedback][:white]}"
    end
  end

  def record_turn(guess, feedback)
    @history.push({ guess: guess, feedback: feedback })
  end

  def announce_winner(guess)
    puts "congratulations! you cracked the code: #{guess.join(' ')}"
  end

  def announce_loss
    puts 'you lost. better luck next time!'
  end

  def current_turn
    @history.size
  end
end

# frozen_string_literal: true

# class in charge of player id
class Player
  VALID_COLORS = %w[r g b y].freeze
  attr_reader :id

  def initialize(id)
    @id = id
  end

  def valid_input?(code)
    code.size == 4 && code.all? { |color| VALID_COLORS.include?(color) }
  end
end

# class player that makes the secret code
class CodeMaker < Player
  def make_code
    # ['y', 'g', 'r', 'b']
    puts 'enter code maker secret code (4 colors: r g b y), seperated by space'
    loop do
      code = gets.chomp.split
      return code if valid_input?(code)

      puts 'invalid code'
    end
  end
end

# class player that guesses the secret code
class CodeBreaker < Player
  def make_guess
    puts 'enter code breaker guess (4 colors: r g b y), seperated by space'
    loop do
      input = gets.chomp.split
      return input if valid_input?(input)

      puts 'invalid guess'
    end
  end
end

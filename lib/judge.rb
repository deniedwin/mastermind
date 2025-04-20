# frozen_string_literal: true

# class that checks if the guess is equal to secret code
class Judge
  def check_code(guess, code) # rubocop:disable Metrics/AbcSize,Metrics/CyclomaticComplexity,Metrics/MethodLength
    black_pegs = 0
    white_pegs = 0
    used_guess_indices = []
    used_code_indices = []

    # check for black pegs
    guess.each_with_index do |color, i|
      next unless color == code[i]

      black_pegs += 1
      used_code_indices.push(i)
      used_guess_indices.push(i)
    end

    # check for white pegs
    guess.each_with_index do |color_guess, i| # rubocop:disable Style/CombinableLoops
      next if used_guess_indices.include?(i)

      code.each_with_index do |color_code, j|
        next unless !used_code_indices.include?(j) && color_guess == color_code

        white_pegs += 1
        used_code_indices.push(j)
        break
      end
    end
    { black: black_pegs, white: white_pegs }
  end

  def win?(feedback)
    feedback[:black] == 4
  end
end

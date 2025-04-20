# frozen_string_literal: true

# class that checks if the guess is equal to secret code
class Judge
  def check_code(guess, code) # rubocop:disable Metrics/AbcSize,Metrics/CyclomaticComplexity,Metrics/MethodLength
    black_pegs = 0
    white_pegs = 0
    used_code_indices = []
    used_guess_indices = []
    # Phase 1: Count black pegs (correct color and position)
    guess.each_with_index do |color, i|
      if color == code[i] # rubocop:disable Style/Next
        black_pegs += 1
        used_code_indices.push(i)
        used_guess_indices.push(i)
      end
    end
    # Phase 2: Count white pegs (correct color, wrong position)
    guess.each_with_index do |color_guess, i| # rubocop:disable Style/CombinableLoops
      if !used_guess_indices.include?(i) # rubocop:disable Style/NegatedIf,Style/Next
        code.each_with_index do |color_code, j|
          if !used_code_indices.include?(j) && color_guess == color_code # rubocop:disable Style/Next
            white_pegs += 1
            used_code_indices.push(j)
            break
          end
        end
      end
    end
    { black: black_pegs, white: white_pegs }
  end

  def win?(feedback)
    feedback[:black] == 4
  end
end

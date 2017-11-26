class Codebreaker
  class Game
    attr_reader :output

    def initialize(output)
      @output = output
    end

    def start(secret_number)
      @secret_number = secret_number

      output.puts "Welcome to Codebreaker"
      output.puts "Enter guess:"
    end

    def guess(input)
      @input = input
      @answer = []
      input_length_check
      count_total_match
      count_exact_match
      count_number_match
      answer_plusses_and_minus
      answer_to_string
    end

private

    def input_length_check
      output.puts "Try guessing a number with four digits" if @input.length != 4
    end

    def count_total_match
      @total_match = @secret_number.count(@input)
    end

    def count_exact_match
    @exact_match = 0
      for i in 0...@secret_number.length
        if @secret_number[i] == @input[i]
          @exact_match += 1
      end
      end
    end

    def count_number_match
      @number_match = @total_match - @exact_match
    end

    def answer_plusses_and_minus
      @exact_match.times do @answer.unshift("+")
      end
      @number_match.times do @answer.push("-")
      end
    end

    def answer_to_string
      output.puts @answer.join("")
    end

  end
end

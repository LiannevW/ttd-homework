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
      input_length_check(input)
      count_total_match
      count_exact_match
      count_number_match
      @answer = []
      answer_plusses
      answer_minus
      answer_to_string
    end

private

    def input_length_check(input)
      if input.length != 4
        output.puts "Try guessing a number with four digits"
      else
        return
      end
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
      @number_match = @total_match.to_i - @exact_match.to_i
    end

    def answer_plusses
      @exact_match.times do
        @answer.unshift("+")
      end
    end

    def answer_minus
      @number_match.times do
        @answer.push("-")
      end
    end

    def answer_to_string
      output.puts @answer.join("")
    end

  end
end

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
      input_length_check(input)
    end

    #private(?)
      def input_length_check(input)
        if input.length != 4 || input.to_i == 0
          output.puts "Try guessing a number with four digits"
        else
          return
        end
      end
  end
end

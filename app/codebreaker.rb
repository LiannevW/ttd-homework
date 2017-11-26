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
      no_matches(input)
      making_input_array(input)
      making_secret_number_array(@secret_number)

      @answer =[]

        4.times do
          rotate_input_array
          rotate_secret_number_array
          mastermind
        end

      answer_to_string

    end

    private

      def input_length_check(input)
        if input.length != 4 || input.to_i == 0
          output.puts "Try guessing a number with four digits"
        else
          return #nu gaat guess method wel verder, maar moet weer opnieuw starten!
        end
      end

      def no_matches(input)
        if input.to_i != @secret_number
          output.puts ""
        end
      end

      def making_input_array(input)
        @input_array = input.split(//)
      end

      def making_secret_number_array(secret_number)
        @secret_number_array = secret_number.split(//)
      end

      def rotate_input_array
        x = @input_array.shift
        @input_array << x
      end

      def rotate_secret_number_array
        y = @secret_number_array.shift
        @secret_number_array << y
      end

      def mastermind
        if @input_array[0] == @secret_number_array[0]
          @answer.unshift("+")
        elsif @input_array[0] == @secret_number_array[1] || @input_array[0] == @secret_number_array[2] ||
          @input_array[0] == @secret_number_array[3]
          @answer.push("-")
        else
          return
        end
      end

      def answer_to_string
        output.puts @answer.join("")
      end
  end
end

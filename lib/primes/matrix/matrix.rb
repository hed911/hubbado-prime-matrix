require "primes/generator/version"
require "primes/generator"
require "primes/matrix/array"

module Primes
  module Matrix
    class Error < StandardError; end
    class InvalidSizeError < StandardError; end
    class InvalidArgumentError < StandardError; end

    # Main function used to create the 2D array containing the F/P numbers

    def self.validate(name, value, max)
      if value > max || value < 0
        raise InvalidSizeError.new("#{name.capitalize} not allowed. It must be between 0 and #{max}")
      end
    end

    def self.create(width, height, algorithm, operation)
      if algorithm != "P" && algorithm != "F"
        raise InvalidArgumentError.new("Algorithm value (#{algorithm}) not allowed, only can be (P)rimes or (F)ibonacci")
      end
      if operation != "A" && operation != "M"
        raise InvalidArgumentError.new("Operation value (#{operation}) not allowed, only can be (A)ddition or (M)ultiplication")
      end
      if algorithm == "P" && operation == "A"
        max = Primes::Generator::MAX_SIZE_PRIME_ADDITION
      elsif algorithm == "P" && operation == "M"
        max = Primes::Generator::MAX_SIZE_PRIME_MULTIPLICATION
      elsif algorithm == "F" && operation == "A"
        max = Primes::Generator::MAX_SIZE_FIBONACCI_ADDITION
      elsif algorithm == "F" && operation == "M"
        max = Primes::Generator::MAX_SIZE_FIBONACCI_MULTIPLICATION
      end
      self.validate("Width", width, max)
      self.validate("Heigh", height, max)
      result = []
      max = [height, width].max
      values = (algorithm == "P") ? Primes::Generator.prime_numbers_in_array(max) :
        Primes::Generator.fibonacci_numbers_in_array(max)
      for i in (0..(height - 1))
        result[i] = []
        for j in (0..(width - 1))
          result[i][j] = (operation == "A") ? values[i] + values[j] : values[i] * values[j]
        end
      end
      result
    end
  end
end

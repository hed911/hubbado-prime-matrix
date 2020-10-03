require "primes/generator/version"
require "primes/generator"
require "primes/matrix/array"

module Primes
  module Matrix
    class Error < StandardError; end
    class InvalidSize < StandardError; end

    # Main function used to create the 2D array containing the prime numbers
    def self.create(n)
      if n > Primes::Generator::MAX_SIZE || n < 0
        raise InvalidSize.new("Size not allowed. It must be between 0 and #{Primes::Generator::MAX_SIZE}")
      end
      result = []
      primes = Primes::Generator.numbers_in_array(n) # Array containing n prime numbers
      for i in (0..(n - 1))
        result[i] = []
        for j in (0..(n - 1))
          result[i][j] = primes[i] + primes[j] # Sum of a-th and b-th prime number
        end
      end
      result
    end
  end
end

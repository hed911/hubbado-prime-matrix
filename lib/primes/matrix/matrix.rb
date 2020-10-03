require "primes/generator/version"
require "primes/generator"
require "primes/matrix/array"

module Primes
  module Matrix
    class Error < StandardError; end
    class InvalidSize < StandardError; end

    def self.create(n)
      if n > Primes::Generator::MAX_SIZE || n < 0
        raise InvalidSize.new("Size not allowed. It must be between 0 and #{Primes::Generator::MAX_SIZE}")
      end
      result = []
      primes = Primes::Generator.numbers_in_array(n)
      for i in (0..(n - 1))
        result[i] = []
        for j in (0..(n - 1))
          result[i][j] = primes[i] + primes[j]
        end
      end
      result
    end
  end
end

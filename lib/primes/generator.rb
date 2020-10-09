require "primes/generator/version"

module Primes
  module Generator
    class Error < StandardError; end
    class NegativeSizeError < StandardError; end

    # Bruteforce version of the algorithm
    def self.numbers_in_array_before(n)
      result = []
      i = 2
      while result.count < n
        flag = 1
        for j in (2..(i / 2))
          if i % j == 0
            flag = 0
            break
          end
        end
        result << i if flag == 1
        i += 1
      end
      result
    end

    # Newer version with Lower O(n)
    # Check any element starting from 2 until find n prime numbers
    def self.prime_numbers_in_array(n)
      raise NegativeSizeError.new("Negative numbers are not allowed") if n < 0
      result = []
      i = 2
      while result.count < n
        result << i if is_prime?(i)
        i += 1
      end
      return result
    end

    def self.is_prime?(n)
      return false if n == 1
      i = 2
      while i * i <= n
        return false if n % i == 0
        i += 1
      end
      return true
    end

    # Iterative version of fibonacci algorithm
    def self.fibonacci_numbers_in_array(n)
      raise NegativeSizeError.new("Negative numbers are not allowed") if n < 0
      return [] if n == 0
      return [1] if n == 1
      return [1, 1] if n == 2
      result = [0, 1]
      index = 2
      (n - 1).times do
        result[index] = result[index - 1] + result[index - 2]
        index += 1
      end
      result = result.drop(1)
      return result
    end

    def self.calculate_max_boundary(algorithm, operation)
      if algorithm == "P" && operation == "A"
        max = Primes::Generator::MAX_SIZE_PRIME_ADDITION
      elsif algorithm == "P" && operation == "M"
        max = Primes::Generator::MAX_SIZE_PRIME_MULTIPLICATION
      elsif algorithm == "F" && operation == "A"
        max = Primes::Generator::MAX_SIZE_FIBONACCI_ADDITION
      elsif algorithm == "F" && operation == "M"
        max = Primes::Generator::MAX_SIZE_FIBONACCI_MULTIPLICATION
      end
      return max
    end
  end
end

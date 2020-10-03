require "primes/generator/version"

module Primes
  module Generator
    class Error < StandardError; end

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
    def self.numbers_in_array(n)
      result = []
      i = 2
      while result.count <= n
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
  end
end

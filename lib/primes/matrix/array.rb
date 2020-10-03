require "primes/generator"

class Array
  # This print the 2D array with a better style making any row contains elements without a coma separator
  def pretty_print
    puts self.map { |x| x.join(" ") }
  end
end

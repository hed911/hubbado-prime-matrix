module Primes
  module Generator
    VERSION = "0.1.0"
    MATRIX_GAP = 5 # number of spaces to delimit the matrix printed in the console
    MAX_SIZE_PRIME_ADDITION = 20000 # Maximun value that n can take to not get any exception
    MAX_SIZE_PRIME_MULTIPLICATION = 10000 # Maximun value that n can take to not get any exception
    MAX_SIZE_FIBONACCI_ADDITION = 2000 # Maximun value that n can take to not get any exception
    MAX_SIZE_FIBONACCI_MULTIPLICATION = 1000 # Maximun value that n can take to not get any exception
    OPERATIONS = {
      "A" => lambda { |matrix, values, i, j| matrix[i][j] = values[i] + values[j] },
      "M" => lambda { |matrix, values, i, j| matrix[i][j] = values[i] * values[j] },
    }
    MAX_VALUES = {
      "P" => {
        "A" => MAX_SIZE_PRIME_ADDITION,
        "M" => MAX_SIZE_PRIME_MULTIPLICATION,
      },
      "F" => {
        "A" => MAX_SIZE_FIBONACCI_ADDITION,
        "M" => MAX_SIZE_FIBONACCI_MULTIPLICATION,
      },
    }
  end
end

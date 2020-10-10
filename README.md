# Code challenge Hubbado second part

## Problem explained

- Allow user to define width and height of the matrix to build use non-square matrix.
- Give user an option for a matrix cell values to use multiplication instead of addition.
- Give user an option to use Fibonacci numbers instead of prime numbers for matrix generation.

So for example for input width=`3`, height=`4`, algorithm=(F)ibonacci, operation=(M)ultiplitacion the output should read:

```shell
1 1 2 3 5
1 1 2 3 5
2 2 4 6 10
3 3 6 9 15
```

## Technologies Used:

Built using:

- Ruby
- RSpec
- CLI (Command Line)
- Github

## How to use:

Clone the repository:

```shell
$ git clone https://github.com/hed911/hubbado-prime-matrix
```

Change into the directory:

```shell
$ cd hubbado-prime-matrix
```

Install gems:

```shell
$ bundle
```

Give permission to execute the script:

```shell
$ chmod +x ./exe/primes-generator
```

To run tests:

```shell
$ rspec
```

To list the commands and arguments:

```shell
$ ./exe/primes-generator --help
```

Run in iterative mode:

```shell
$ ./exe/primes-generator
```

Run in shortcut mode (with 5x4 matrix, fibonacci, addition):

```shell
$ ./exe/primes-generator --width 5 --height 4 --algorithm F --operation M
```

## Code optimization:

I used a hash as a constant to store the max values.

```shell
MAX_VALUES = {
  "P" => {
    "A" => Primes::Generator::MAX_SIZE_PRIME_ADDITION,
    "M" => Primes::Generator::MAX_SIZE_PRIME_MULTIPLICATION
  },
  "F" => {
    "A" => Primes::Generator::MAX_SIZE_FIBONACCI_ADDITION,
    "M" => Primes::Generator::MAX_SIZE_FIBONACCI_MULTIPLICATION
  }
}
```

So I can easily access to that values without any conditions.
For example:

```shell
MAX_VALUES["P"]["A"]
```

I used a hash of lambdas as a constant to encapsulate this functions to the keys "A" and "M" respectively

```shell
OPERATIONS = {
  "A" => lambda { |matrix, values, i, j| matrix[i][j] = values[i] + values[j] },
  "M" => lambda { |matrix, values, i, j| matrix[i][j] = values[i] * values[j] },
}
```

Next, instead of this sentence `(operation == "A") ? values[i] + values[j] : values[i] * values[j]`
I would put a `yield` to make this logic variable

```shell
def self.create(width, height, algorithm, operation)
  if algorithm != "P" && algorithm != "F"
    raise InvalidArgumentError.new("Algorithm value (#{algorithm}) not allowed, only can be (P)rimes or (F)ibonacci")
  end
  if operation != "A" && operation != "M"
    raise InvalidArgumentError.new("Operation value (#{operation}) not allowed, only can be (A)ddition or (M)ultiplication")
  end
  max = Primes::Generator.MAX_VALUES[algorithm][operation]
  self.validate("Width", width, max)
  self.validate("Heigh", height, max)
  result = []
  max = [height, width].max
  values = (algorithm == "P") ? Primes::Generator.prime_numbers_in_array(max) :
    Primes::Generator.fibonacci_numbers_in_array(max)
  for i in (0..(height - 1))
    result[i] = []
    for j in (0..(width - 1))
      result[i][j] = yield(values, i, j)
    end
  end
  result
end
```

So I can call the method including a block using the `OPERATIONS` constant defined before

```shell
Primes::Matrix.create(3, 3, "F", "M"){ |m, v, i, j| Primes::Generator::OPERATIONS["M"].call(m, v, i, j) }
```

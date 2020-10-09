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

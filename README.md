# Prime numbers sum matrix

## Problem explained

Write a simple program which takes a single number n from the user and in response displays n\*n table, such that the content of cell (a,b) is a sum of a-th and b-th prime number.
So for example for input `3` the output should read:
4 5 7
5 6 8
7 8 10

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

To run tests:

```shell
$ rspec
```

To get the n\*n matrix with the sum of prime numbers (with n = 3):

```shell
$ ./exe/primes-generator -n 3
```

To list the commands and arguments:

```shell
$ ./exe/primes-generator --help
```

require "minitest/autorun"
RSpec.describe Primes::Matrix do
  it "Generates an empty 2D array [] with width=0, height=0, algorithm=Primes, operation=Addition" do
    expect(Primes::Matrix.create(0, 0, "P", "A")).to eq([])
  end

  it "Generates an empty 2D array [] with width=0, height=0, algorithm=Primes, operation=Multiplication" do
    expect(Primes::Matrix.create(0, 0, "P", "M")).to eq([])
  end

  it "Generates an empty 2D array [] with width=0, height=0, algorithm=Fibonacci, operation=Addition" do
    expect(Primes::Matrix.create(0, 0, "F", "A")).to eq([])
  end

  it "Generates an empty 2D array [] with width=0, height=0, algorithm=Fibonacci, operation=Multiplication" do
    expect(Primes::Matrix.create(0, 0, "F", "M")).to eq([])
  end
  #
  it "Generates only [[4]] with width=1, height=1, algorithm=Primes, operation=Addition" do
    expect(Primes::Matrix.create(1, 1, "P", "A")).to eq([[4]])
  end

  it "Generates only [[4]] with width=1, height=1, algorithm=Primes, operation=Multiplication" do
    expect(Primes::Matrix.create(1, 1, "P", "M")).to eq([[4]])
  end

  it "Generates only [[2]] with width=1, height=1, algorithm=Fibonacci, operation=Addition" do
    expect(Primes::Matrix.create(1, 1, "F", "A")).to eq([[2]])
  end

  it "Generates only [[1]] with width=1, height=1, algorithm=Fibonacci, operation=Multiplication" do
    expect(Primes::Matrix.create(1, 1, "F", "M")).to eq([[1]])
  end
  #
  it "Generates [[4, 5, 7], [5, 6, 8], [7, 8, 10]] with width=3, height=3, algorithm=Primes, operation=Addition" do
    expect(Primes::Matrix.create(3, 3, "P", "A")).to eq([[4, 5, 7], [5, 6, 8], [7, 8, 10]])
  end

  it "Generates [[4, 6, 10], [6, 9, 15], [10, 15, 25]] with width=3, height=3, algorithm=Primes, operation=Multiplication" do
    expect(Primes::Matrix.create(3, 3, "P", "M")).to eq([[4, 6, 10], [6, 9, 15], [10, 15, 25]])
  end

  it "Generates [[2, 2, 3], [2, 2, 3], [3, 3, 4]] with width=3, height=3, algorithm=Fibonacci, operation=Addition" do
    expect(Primes::Matrix.create(3, 3, "F", "A")).to eq([[2, 2, 3], [2, 2, 3], [3, 3, 4]])
  end

  it "Generates [[1, 1, 2], [1, 1, 2], [2, 2, 4]] with width=3, height=3, algorithm=Fibonacci, operation=Multiplication" do
    expect(Primes::Matrix.create(3, 3, "F", "M")).to eq([[1, 1, 2], [1, 1, 2], [2, 2, 4]])
  end
  #
  it "Raise InvalidSizeError width < 0, height < 0, algorithm=Primes, operation=Addition" do
    expect { Primes::Matrix.create(-1, -1, "P", "A").length }.to raise_exception(Primes::Matrix::InvalidSizeError)
  end

  it "Raise InvalidSizeError width < 0, height < 0, algorithm=Primes, operation=Multiplication" do
    expect { Primes::Matrix.create(-1, -1, "P", "M").length }.to raise_exception(Primes::Matrix::InvalidSizeError)
  end

  it "Raise InvalidSizeError width < 0, height < 0, algorithm=Fibonacci, operation=Addition" do
    expect { Primes::Matrix.create(-1, -1, "F", "A").length }.to raise_exception(Primes::Matrix::InvalidSizeError)
  end

  it "Raise InvalidSizeError width < 0, height < 0, algorithm=Fibonacci, operation=Multiplication" do
    expect { Primes::Matrix.create(-1, -1, "F", "M").length }.to raise_exception(Primes::Matrix::InvalidSizeError)
  end
  #
  it "Works with width=#{Primes::Generator::MAX_SIZE_PRIME_ADDITION}, height=#{Primes::Generator::MAX_SIZE_PRIME_ADDITION}, algorithm=Primes, operation=Addition" do
    puts "Generating data, please wait ..."
    expect { Primes::Matrix.create(Primes::Generator::MAX_SIZE_PRIME_ADDITION, Primes::Generator::MAX_SIZE_PRIME_ADDITION, "P", "A").length }.to_not raise_exception
  end

  it "Works with width=#{Primes::Generator::MAX_SIZE_PRIME_MULTIPLICATION}, height=#{Primes::Generator::MAX_SIZE_PRIME_MULTIPLICATION}, algorithm=Primes, operation=Multiplication" do
    puts "Generating data, please wait ..."
    expect { Primes::Matrix.create(Primes::Generator::MAX_SIZE_PRIME_MULTIPLICATION, Primes::Generator::MAX_SIZE_PRIME_MULTIPLICATION, "P", "M").length }.to_not raise_exception
  end

  it "Works with width=#{Primes::Generator::MAX_SIZE_FIBONACCI_ADDITION}, height=#{Primes::Generator::MAX_SIZE_FIBONACCI_ADDITION}, algorithm=Fibonacci, operation=Addition" do
    puts "Generating data, please wait ..."
    expect { Primes::Matrix.create(Primes::Generator::MAX_SIZE_FIBONACCI_ADDITION, Primes::Generator::MAX_SIZE_FIBONACCI_ADDITION, "F", "A").length }.to_not raise_exception
  end

  it "Works with width=#{Primes::Generator::MAX_SIZE_FIBONACCI_MULTIPLICATION}, height=#{Primes::Generator::MAX_SIZE_FIBONACCI_MULTIPLICATION}, algorithm=Fibonacci, operation=Multiplication" do
    puts "Generating data, please wait ..."
    expect { Primes::Matrix.create(Primes::Generator::MAX_SIZE_FIBONACCI_MULTIPLICATION, Primes::Generator::MAX_SIZE_FIBONACCI_MULTIPLICATION, "F", "M").length }.to_not raise_exception
  end
  #
  it "Must have as a result a 2D array with width=10, height=10, algorithm=Primes, operation=Addition" do
    expect(Primes::Matrix.create(10, 10, "P", "A").length).to eq(10)
    expect(Primes::Matrix.create(10, 10, "P", "A")[0].length).to eq(10)
  end

  it "Must have as a result a 2D array with width=10, height=10, algorithm=Primes, operation=Multiplication" do
    expect(Primes::Matrix.create(10, 10, "P", "M").length).to eq(10)
    expect(Primes::Matrix.create(10, 10, "P", "M")[0].length).to eq(10)
  end

  it "Must have as a result a 2D array with width=10, height=10, algorithm=Fibonacci, operation=Addition" do
    expect(Primes::Matrix.create(10, 10, "F", "A").length).to eq(10)
    expect(Primes::Matrix.create(10, 10, "F", "A")[0].length).to eq(10)
  end

  it "Must have as a result a 2D array with width=10, height=10, algorithm=Fibonacci, operation=Multiplication" do
    expect(Primes::Matrix.create(10, 10, "F", "M").length).to eq(10)
    expect(Primes::Matrix.create(10, 10, "F", "M")[0].length).to eq(10)
  end

  it "Raise InvalidArgumentError width=1, height=1, algorithm=X, operation=Addition" do
    expect { Primes::Matrix.create(1, 1, "X", "A").length }.to raise_exception(Primes::Matrix::InvalidArgumentError)
  end

  it "Raise InvalidArgumentError width=1, height=1, algorithm=Fibonacci, operation=X" do
    expect { Primes::Matrix.create(1, 1, "P", "X").length }.to raise_exception(Primes::Matrix::InvalidArgumentError)
  end
end

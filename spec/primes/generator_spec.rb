require "minitest/autorun"
RSpec.describe Primes::Generator do
  it "Primes: Generates an empty array [] with n = 0" do
    expect(Primes::Generator.prime_numbers_in_array(0)).to eq([])
  end

  it "Primes: Generates only [2] with n = 1" do
    expect(Primes::Generator.prime_numbers_in_array(1)).to eq([2])
  end

  it "Primes: Generates [2, 3, 5] with n = 3" do
    expect(Primes::Generator.prime_numbers_in_array(3)).to eq([2, 3, 5])
  end

  it "Primes: Raise NegativeSizeError when n < 0" do
    expect { Primes::Generator.prime_numbers_in_array(-1).length }.to raise_exception(Primes::Generator::NegativeSizeError)
  end

  it "Primes: Works with n = #{Primes::Generator::MAX_SIZE_PRIME_ADDITION}" do
    expect { Primes::Generator.prime_numbers_in_array(Primes::Generator::MAX_SIZE_PRIME_ADDITION).length }.to_not raise_exception
  end

  it "Primes: Must have as a result an array with length = n" do
    expect(Primes::Generator.prime_numbers_in_array(10).length).to eq(10)
  end

  it "Fibonacci: Generates an empty array [] with n = 0" do
    expect(Primes::Generator.fibonacci_numbers_in_array(0)).to eq([])
  end

  it "Fibonacci: Generates only [1] with n = 1" do
    expect(Primes::Generator.fibonacci_numbers_in_array(1)).to eq([1])
  end

  it "Fibonacci: Generates only [1, 1] with n = 2" do
    expect(Primes::Generator.fibonacci_numbers_in_array(2)).to eq([1, 1])
  end

  it "Fibonacci: Generates [1, 1, 2] with n = 3" do
    expect(Primes::Generator.fibonacci_numbers_in_array(3)).to eq([1, 1, 2])
  end

  it "Fibonacci: Raise NegativeSizeError when n < 0" do
    expect { Primes::Generator.fibonacci_numbers_in_array(-1).length }.to raise_exception(Primes::Generator::NegativeSizeError)
  end

  it "Fibonacci: Works with n = #{Primes::Generator::MAX_SIZE_FIBONACCI_ADDITION}" do
    expect { Primes::Generator.fibonacci_numbers_in_array(Primes::Generator::MAX_SIZE_FIBONACCI_ADDITION).length }.to_not raise_exception
  end

  it "Fibonacci: Must have as a result an array with length = n" do
    expect(Primes::Generator.fibonacci_numbers_in_array(10).length).to eq(10)
  end
end

require "minitest/autorun"
RSpec.describe Primes::Matrix do
  it "Generates an empty 2D array [] with n = 0" do
    expect(Primes::Matrix.create(0)).to eq([])
  end

  it "Generates only [[4]] with n = 1" do
    expect(Primes::Matrix.create(1)).to eq([[4]])
  end

  it "Generates [[4, 5, 7], [5, 6, 8], [7, 8, 10]] with n = 3" do
    expect(Primes::Matrix.create(3)).to eq([[4, 5, 7], [5, 6, 8], [7, 8, 10]])
  end

  it "Raise InvalidSizeError when n < 0" do
    expect { Primes::Matrix.create(-1).length }.to raise_exception(Primes::Matrix::InvalidSizeError)
  end

  it "Works with n = #{Primes::Generator::MAX_SIZE}" do
    puts "Generating data, please wait ..."
    expect { Primes::Matrix.create(Primes::Generator::MAX_SIZE).length }.to_not raise_exception
  end

  it "Must have as a result a 2D array with length = n*n" do
    expect(Primes::Matrix.create(10).length).to eq(10)
    expect(Primes::Matrix.create(10)[0].length).to eq(10)
  end
end

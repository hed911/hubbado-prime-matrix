require "minitest/autorun"
RSpec.describe Primes::Generator do
  it "Generates an empty array [] with n = 0" do
    expect(Primes::Generator.numbers_in_array(0)).to eq([])
  end

  it "Generates only [2] with n = 1" do
    expect(Primes::Generator.numbers_in_array(1)).to eq([2])
  end

  it "Generates [2, 3, 5] with n = 3" do
    expect(Primes::Generator.numbers_in_array(3)).to eq([2, 3, 5])
  end

  it "Raise NegativeSizeError when n < 0" do
    expect { Primes::Generator.numbers_in_array(-1).length }.to raise_exception(Primes::Generator::NegativeSizeError)
  end

  it "Works with n = #{Primes::Generator::MAX_SIZE}" do
    expect { Primes::Generator.numbers_in_array(Primes::Generator::MAX_SIZE).length }.to_not raise_exception
  end

  it "Must have as a result an array with length = n" do
    expect(Primes::Generator.numbers_in_array(10).length).to eq(10)
  end
end

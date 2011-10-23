require 'minitest/spec'
require 'minitest/autorun'

class PrimeFactors
  def self.generate( number )
    
    result = []
    candidate = 2

    while candidate <= number
      if number%candidate == 0 
        result << candidate
        number /= candidate
        candidate = 1
      end

      candidate += 1
    end

    return result
  end
end

describe PrimeFactors do
  
  def calculate_factors( number )
    return PrimeFactors.generate( number )
  end

  it 'should return the prime factors for 1' do
    calculate_factors( 1 ).must_equal([])
  end

  it 'should return prime factors for 2' do
    calculate_factors( 2 ).must_equal([2])
  end

  it 'should return prime factors for 3' do
    calculate_factors( 3 ).must_equal([3])
  end

  it 'should return prime factors for 4' do
    calculate_factors( 4 ).must_equal([2,2])
  end

  it 'should return prime factors for 9' do
    calculate_factors( 9 ).must_equal( [3,3] )
  end

  it 'should return prime factor for 6' do
    calculate_factors( 6 ).must_equal( [2,3])
  end

  it 'should return prime factor for 8' do
    calculate_factors( 8 ).must_equal( [2,2,2])
  end

  it 'should return prime factor for 12' do
    calculate_factors( 12 ).must_equal( [2,2,3])
  end

  it 'should return prime factor for 20' do
    calculate_factors( 20 ).must_equal( [2,2,5])
  end

  it 'should return prime factor for 13' do
    calculate_factors( 13 ).must_equal( [13])
  end

  it 'should return prime factor for 26' do
    calculate_factors( 26 ).must_equal( [2,13])
  end

end



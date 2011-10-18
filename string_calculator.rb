require 'minitest/spec'
require 'minitest/autorun'



class StringCalculator
  def add( numbers_string )
    result = 0
    elements = numbers_string.split(/,|\n/)

    elements.each do |element|
      result = result + element.strip.to_i
    end
    return result
  end
end

describe StringCalculator do
  before do
    @calculator = StringCalculator.new
  end
  

  it "should add numbers separed by comma" do
    result = @calculator.add( "1,2,3,4" )
    result.must_equal 10
  end

  it "should support negative numbers" do
    result = @calculator.add "-1,2,3,4"
    result.must_equal 8
  end

  it "should ignore non numeric values" do
    result = @calculator.add "1, , nil, 12, -1"
    result.must_equal 12
  end

  it "should support newline as separator instead of comma" do
    result = @calculator.add "1\n2,3,4"
    result.must_equal 10
  end
end



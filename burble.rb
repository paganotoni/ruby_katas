require 'minitest/spec'
require 'minitest/autorun'

class BurbleSorter

  def sort( sent_data )
    sent_data.delete nil
    needs_sort = true

    while needs_sort
      needs_sort = false

      sent_data.each_with_index do |data, index|
        if index < sent_data.length - 1 && data > sent_data[ index + 1 ]
          needs_sort = true
          temp = data
          sent_data[ index ] = sent_data[ index + 1 ]
          sent_data[ index + 1 ] = temp
        end
      end

    end

    return sent_data
  end

end

describe BurbleSorter do
  
  before do
    @sorter = BurbleSorter.new
  end
  
  it "should sort ascendenting an Array" do
    sorted = @sorter.sort( [3,1,2] )
    sorted.must_equal [1,2,3] 
  end

  it "should sort even if there are negative values" do
    sorted = @sorter.sort( [1,12,15,0,-1]);
    sorted.must_equal [-1,0,1,12,15] 
  end

  it "should remove nil values from the array" do
    sorted = @sorter.sort [nil, 1, 3, nil , 2, nil, 4]
    sorted.must_equal([1,2,3,4])
  end
  
end



require 'minitest/spec'
require 'minitest/autorun'

# Firts Attemp for quicksort, seems to work.
class QuickSorter

  def sort( data )
    data.delete( nil )

    if data.length <= 0
      return data
    else
      pivot = data[0]
      cloned = [nil] + data[1..data.length]

      smaller = []
      bigger = []
      cloned.each_with_index do |elem, index|
        if elem.nil? == false && elem <= pivot
          nil_index = cloned.index(nil)
          nil_index

          cloned[nil_index] = elem
          cloned = cloned[0..index-1] + cloned[index+1..cloned.length()]
          cloned.insert(nil_index+1, nil)      
        end
      end

      nil_index = cloned.index(nil)

      left = nil_index > 0 ? cloned[0..nil_index-1] : []
      right = cloned[nil_index+1..cloned.length]

      left = sort( left ) if left.length >= 2
      right = sort( right ) if right.length >= 2

      return left+[pivot]+right
    end
  end
end

describe QuickSorter do
  before do
    @sorter = QuickSorter.new
  end

  it "should sort ascending an array" do
    result = @sorter.sort( [1,2,5,6,3,4] )
    result.must_equal( [1,2,3,4,5,6])
  end

  it "should support negative numbers" do
    result = @sorter.sort( [-1,1,2,100,-1120] )
    result.must_equal( [-1120,-1,1,2,100] )
  end

  it "should remove nil values" do
    result = @sorter.sort( [nil, 1, nil, 3, nil, 2 ] )
    result.must_equal( [1,2,3] )
  end

  it "should support empty arrays" do
    result = @sorter.sort( [] )
    result.must_equal( [] )
  end
end


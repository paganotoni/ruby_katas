# Firts Attemp for quicksort, seems to work.

def quicksort( data )
  pivot = data[0]
  cloned = [nil] + data[1..data.length]

  smaller = []
  bigger = []
  cloned.each_with_index do |elem, index|
    if elem != nil && elem <= pivot
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
  
  left = quicksort( left ) if left.length >= 2
  right = quicksort( right ) if right.length >= 2

  return left+[pivot]+right
end

data = [6,2,1,3,4,7,5,9]
puts "- Initial Data for sorting:"
puts "* "+data.to_s
puts "- Sorted Data:"
puts "* "+quicksort( data ).to_s



require "benchmark"
require"./bubblesort.rb"


def bubblesort_noflag(array)
  len = array.length
  

  while len > 1 do
    
    (len-1).times do |i|      
      if array[i] > array[i+1]
        array[i], array[i+1] = array[i+1], array[i]
       
      end
    end
    
    len -= 1
  end
  return array
end

array = (1..100).to_a.shuffle
p array

p bubblesort(array)

array2 = ["hi","hello","hey"]

bubble_sort_by(array) 
# puts Benchmark.measure {100.times {bubble_sort_by(array2) do |left,right|
#   left.length - right.length
# end}}

puts Benchmark.measure {100.times {bubble_sort_by(array) }}
puts Benchmark.measure {100.times {bubblesort(array) }}              #fastest by far
puts Benchmark.measure {100.times {bubblesort_noflag(array) }}

puts Benchmark.measure {100.times {bubble_sort_by_old(array) }}
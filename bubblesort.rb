#!/home/rathersilly/.rvm/rubies/ruby-2.4.0/bin/ruby

#can do recursively

def bubblesort(array)
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

def bubble_sort_by(array)
  len = array.length  
  while len > 1
    (len-1).times do |i|      
      difference = 0
      if block_given?
        difference = yield(array[i], array[i+1])
      else
        difference = array[i] - array[i+1]
      end
      array[i], array[i+1] = array[i+1], array[i] if difference > 0
    end
    len -= 1
  end
  p array
  return array
end

array = [4,3,78,2,0,2]
p array

p bubblesort(array)

array2 = ["hi","hello","hey"]

bubble_sort_by(array) 
bubble_sort_by(array2) do |left,right|
  left.length - right.length
end


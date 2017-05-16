#!/home/rathersilly/.rvm/rubies/ruby-2.4.0/bin/ruby



def bubblesort(array)
  len = array.length
  

  while len > 1 
    change_flag = false
    (len-1).times do |i|      
      if array[i] > array[i+1]
        array[i], array[i+1] = array[i+1], array[i]
        change_flag = true
      end
    end
    break if change_flag == false
    len -= 1
  end
  return array
end

def bubble_sort_by(array)         #super slow
  len = array.length 
  if block_given?
    difference = Proc.new {|a,b| yield a, b}
  else
    difference = Proc.new {|a,b| a - b}
  end
  
  while len > 1
    (len-1).times do |i|      
      diff = 0
      array[i], array[i+1] = array[i+1], array[i] if difference.call(array[i], array[i+1]) > 0
    end
    len -= 1
  end
  #p array
  return array
end

def bubble_sort_by_old(array)     #faster than proc method
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
  
  return array
end
=begin
array = [4,3,78,2,0,2]
p array

p bubblesort(array)

array2 = ["hi","hello","hey"]

bubble_sort_by(array) 
bubble_sort_by(array2) do |left,right|
  left.length - right.length
end
=end
# array2 = ["hi","hello","hey"]
# bubble_sort_by(array2) do |left,right|
#   left.length - right.length
# end

array = [4,3,78,2,0,2]
bubble_sort_by(array)

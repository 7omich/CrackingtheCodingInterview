# Time complexity: O(logn)
# Imput format is as follows:
# 5
# 1 2 3 4 5
# 3
# 3 4 1

n = gets.chomp.to_i
s = gets.chomp.split(' ').map(&:to_i)
q = gets.chomp.to_i
t = gets.chomp.split(' ').map(&:to_i)

def binary_search(arr, n, key)
  left = 0
  right = n
  while left < right
    mid = (left + right) / 2
    if arr[mid] == key
      return mid
    elsif key < arr[mid]
      right = mid
    else
      left = mid + 1
    end
  end
  return false
end

count = 0

t.each do |obj|
  if binary_search(s, n, obj)
    count += 1
  end
end

print "#{count}\n"

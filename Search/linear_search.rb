# Time complexity: O(n)
# Input format is as follows:
# 5
# 1 2 3 4 5
# 3
# 3 4 1

n = gets.chomp.to_i
s = gets.chomp.split(' ').map(&:to_i)
q = gets.chomp.to_i
t = gets.chomp.split(' ').map(&:to_i)

def linear_search(arr, n, key)
  i = 0
  arr[n] = key
  while arr[i] != key
    i += 1
  end
  if i == n
    return false
  end
  return i
end

count = 0

t.each do |obj|
  if linear_search(s, n, obj)
    count += 1
  end
end

print "#{count}\n"

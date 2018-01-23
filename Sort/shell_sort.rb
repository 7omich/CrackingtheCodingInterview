# Time complexity: O(n^1.25)
# Input format is as follows:
# 5
# 5
# 1
# 4
# 3
# 2

n = gets.chomp.to_i
arr = []
(0...n).each do |i|
  arr[i] = gets.chomp.to_i
end

@count = 0
@g_arr = []

def insertion_sort(arr, n, g)
  (g..n-1).each do |i|
    v = arr[i]
    j = i - g
    while j >= 0 && arr[j] > v
      arr[j + g] = arr[j]
      j -= g
      @count += 1
    end
    arr[j + g] = v
  end
end

def shell_sort(arr, n)
  h = 1
  while h <= n
    @g_arr.unshift(h)
    h = h * 3 + 1
  end

  @g_arr.each do |g|
    insertion_sort(arr, n, g)
  end
end

shell_sort(arr, n)
print "#{@g_arr.count}\n#{@g_arr.join(' ')}\n#{@count}\n"
arr.each do |obj|
  print "#{obj}\n"
end

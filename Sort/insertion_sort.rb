# Time complexity: O(n^2)
# Input format is as follows:
# 6
# 5 2 4 6 1 3

n = gets.chomp.to_i
arr = gets.chomp.split(' ').map(&:to_i)

def insertion_sort(arr, n)
  (1..n-1).each do |i|
    v = arr[i]
    j = i - 1
    while j >= 0 && arr[j] > v
      arr[j + 1] = arr[j]
      j -= 1
    end
    arr[j + 1] = v
    print "#{arr.join(' ')}\n"
  end
end

print "#{arr.join(' ')}\n"
insertion_sort(arr, n)

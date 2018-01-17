# Time complexity: O(n^2)
# Input format is as follows:
# 6
# 5 6 4 2 1 3

n = gets.chomp.to_i
arr = gets.chomp.split(' ').map(&:to_i)

def selection_sort(arr, n)
  swap_times = 0
  (0..n-2).each do |i|
    minj = i
    (i..n-1).each do |j|
      if arr[j] < arr[minj]
        minj = j
      end
    end
    tmp = arr[i]
    arr[i] = arr[minj]
    arr[minj] = tmp
    if i != minj
      swap_times += 1
    end
  end
  print "#{arr.join(' ')}\n#{swap_times}\n"
end

selection_sort(arr, n)

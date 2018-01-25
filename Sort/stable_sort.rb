# Time complexity: Sort -> O(n^2), Comparison -> O(n)
# Input format is as follows:
# 5
# H4 C9 S4 D2 C3

n = gets.chomp.to_i
arr1 = gets.chomp.split(' ')
arr2 = []

(0...n).each do |i|
  arr1[i] = arr1[i].split('')
  arr1[i][1] = arr1[i][1].to_i
  arr2[i] = arr1[i]
end

def is_same?(arr1, arr2, n)
  (0...n).each do |i|
    if arr1[i] != arr2[i]
      return false
    end
  end
  return true
end

def bubble_sort(arr, n)
  swap_times = 0
  flag = true
  i = 0
  while flag && i < n - 1
    flag = false
    j = n - 1
    while j >= i + 1
      if arr[j][1] < arr[j - 1][1]
        swap_times += 1
        tmp = arr[j]
        arr[j] = arr[j - 1]
        arr[j - 1] = tmp
        flag = true
      end
      j -= 1
    end
    i += 1
  end
end

def selection_sort(arr, n)
  swap_times = 0
  (0..n-2).each do |i|
    minj = i
    (i..n-1).each do |j|
      if arr[j][1] < arr[minj][1]
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
end

bubble_sort(arr1, n)
print "#{arr1.map { |obj| obj.join }.join(' ')}\nStable\n"
selection_sort(arr2, n)
print "#{arr2.map { |obj| obj.join }.join(' ')}\n"
if is_same?(arr1, arr2, n)
  print "Stable\n"
else
  print "Not stable\n"
end

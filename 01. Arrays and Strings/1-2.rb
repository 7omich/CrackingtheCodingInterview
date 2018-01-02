# Time complexity: O(nlogn)

str1 = gets.chomp
str2 = gets.chomp

def is_permutation?(str1, str2)
  str1_sorted = str1.split('').sort.join
  str2_sorted = str2.split('').sort.join

  return str1_sorted == str2_sorted
end

p is_permutation?(str1, str2)

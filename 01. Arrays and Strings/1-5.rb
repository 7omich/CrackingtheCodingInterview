# Time complexity: O(n)
# Input format is as follows:
# pales, pale

str1, str2 = gets.chomp.split(', ')

def is_one_Levenshtein_distance?(str1, str2)
  if str1.length == str2.length
    return is_repleced_pair?(str1, str2)
  elsif str1.length > str2.length
    return is_deleted_pair?(str1, str2)
  else
    return is_deleted_pair?(str2, str1)
  end
end

def is_repleced_pair?(str1, str2)
  arr1 = str1.split('')
  arr2 = str2.split('')
  n = arr1.size
  diff_chars = 0

  (1..n).each do |i|
    if arr1[i-1] != arr2[i-1]
      diff_chars += 1
    end
  end

  if diff_chars > 1
    return false
  else
    return true
  end
end

def is_deleted_pair?(str1, str2)
  arr1 = str1.split('')

  arr1.each_with_index do |char, i|
    tmp = arr1.dup
    tmp.delete_at(i)
    if tmp.join == str2
      return true
    end
  end

  return false
end

p is_one_Levenshtein_distance?(str1, str2)

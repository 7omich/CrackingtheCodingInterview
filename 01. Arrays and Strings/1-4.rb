# Time complexity: O(n)

str = gets.chomp

def is_palindrome_permutation?(str)
  hash = Hash.new
  arr = str.split('')
  arr.delete(' ')
  arr.each do |char|
    hash[char] = hash.has_key?(char) ? hash[char] += 1 : 1
  end

  n = hash.select { |k, v| v.odd? }.count
  if n > 2
    return false
  else
    return true
  end
end

p is_palindrome_permutation?(str)

# Time complexity: O(n)
# Input format is as follows (exclude double quotes):
# Mr Join Smith   , 13

input = gets.chomp.split(', ')
str = input[0]
n = input[1].to_i

def URLify(str, n)
  arr = str.split('')[0..n-1]
  arr.each_with_index do |char, i|
    arr[i] = char == ' ' ? '%20' : char
  end

  return arr.join
end

p URLify(str, n)

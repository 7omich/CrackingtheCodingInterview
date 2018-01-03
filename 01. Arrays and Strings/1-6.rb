# Time complexity: O(n)

str = gets.chomp

def string_compress(str)
  arr = str.split('')
  new_arr = Array.new
  arr.each_with_index do |char, i|
    if i == 0
      new_arr[0] = char
      new_arr[1] = 1
    elsif arr[i-1] == arr[i]
      new_arr[-1] += 1
    else
      new_arr.push(char)
      new_arr.push(1)
    end
  end

  new_str = new_arr.join
  if new_str.length < str.length
    return new_str
  else
    return str
  end
end

p string_compress(str)

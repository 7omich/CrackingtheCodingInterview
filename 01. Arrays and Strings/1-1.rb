# Time complexity: O(n)

str = gets.chomp

def is_unique_chars?(str)
  arr = Array.new(26, nil)
  ('a'..'z').each_with_index do |alph, i|
    str.split('').each do |char|
      if char == alph
        arr[i] = arr[i].nil? ? true : false
      end
    end
  end

  if arr.include?(false)
    return false
  else
    return true
  end
end

p is_unique_chars?(str)

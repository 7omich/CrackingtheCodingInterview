# Input format is as follows:
# 10000000000 10011 2 6

input = gets.chomp.split(' ').map(&:to_i)
n = input[0].to_s.to_i(2)
m = input[1].to_s.to_i(2)
i = input[2].to_i
j = input[3].to_i

def bit_insertion(n, m, i, j)
  left_mask = -1 << (j + 1)
  right_mask = (1 << i) - 1
  mask = left_mask | right_mask
  return (n & mask) | (m << i)
end

p bit_insertion(n, m, i, j).to_s(2).to_i

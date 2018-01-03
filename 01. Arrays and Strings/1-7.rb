# Time complexity:
# Input format is as follows:
# 3
# 2 3 5
# 1 9 4
# 4 6 2

n = gets.chomp.to_i
matrix = Array.new(n, nil)
(1..n).each do |i|
  matrix[i-1] = gets.chomp.split(' ').map(&:to_i)
end

def rotate(matrix, n)
  layer = (n + 1) / 2  # Int
  (1..layer).each do |i|
    (1..i).each do |k|
      tmp = matrix[layer - i][layer - i + k - 1]
      matrix[layer - i][layer - i + k - 1] = matrix[n - layer + i - k][layer - i]
      # first layer odd?/even?
    end
  end
end

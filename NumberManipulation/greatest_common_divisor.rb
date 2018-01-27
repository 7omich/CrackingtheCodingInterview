# Time complexity:
# Imput format is as follows:
# 147 105

a, b = gets.chomp.split(' ').map(&:to_i)

while [a, b].max % [a, b].min != 0
  x = [a, b].max
  y = [a, b].min
  a = y
  b = x % y
end

print "#{[a, b].min}\n"

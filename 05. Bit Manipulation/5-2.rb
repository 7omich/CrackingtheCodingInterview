r = gets.chomp.to_f

def binary_float(r)
  ans = ['0.']
  while r > 0
    return "ERROR" if ans.count > 32
    r *= 2
    if r >= 1
      ans.push('1')
      r -= 1
    else
      ans.push('0')
    end
  end
  return ans.join.to_f
end

p binary_float(r)

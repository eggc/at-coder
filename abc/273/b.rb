X, K = gets.split.map(&:to_i)

current = X

K.times do |i|
  current_str = current.to_s

  # 下から i 桁目を四捨五入する
  digit = current_str[-(i+1)]

  break current = 0 if digit.nil?

  digit = digit.to_i

  if digit <= 4
    current_str[-(i+1)] = '0'
    current = current_str.to_i
  else
    current_str[-(i+1)] = '0'
    current = current_str.to_i + (10 ** (i+1))
  end
end

puts current

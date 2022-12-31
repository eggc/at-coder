S = gets
answer = 0

S.chars.each do |c|
  case c
  when 'v'
    answer += 1
  when 'w'
    answer += 2
  end
end

puts answer

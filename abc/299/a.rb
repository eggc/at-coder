N = gets.to_i
S = gets

first = nil

S.each_char do |c|
  if c == '|' && first.nil?
    first = true
  elsif c == '*' && first
    puts 'in'
    exit
  elsif c == '|' && first
    first = false
  end
end

puts 'out'

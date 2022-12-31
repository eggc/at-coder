N = gets.to_i
S = gets

quoted = false

S.each_char do |c|
  if c == '"'
    quoted = !quoted
    print c
  elsif !quoted && c == ','
    print '.'
  else
    print c
  end
end

puts

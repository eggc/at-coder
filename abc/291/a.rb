S = gets

i = 1

S.each_char do |c|
  if c.upcase == c
    puts i
    exit
  else
    i += 1
  end
end

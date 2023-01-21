S = gets.chomp

def char_to_number(char)
  char.ord - 'A'.ord + 1
end

def solve(string)
  if string.length > 1
    solve(string[..-2]) * 26 + char_to_number(string[-1])
  else
    char_to_number(string[0])
  end
end

puts solve(S)

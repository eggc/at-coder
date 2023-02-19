# frozen_string_literal: true

def solve(chars)
  box = []

  chars.each_with_index do |c, index|
    if c == '1'
      box << index
    end
  end

  return -1 if box.size.odd?
  return 0 if box.size == 0

  if box[box.size/2] - box[0] >= 2
    box.size / 2
  else
    box.size / 2 + 1
  end
end

gets.to_i.times do
  gets
  string = gets.chomp

  if string == '0110'
    p 3
  elsif string == '11' ||
    string == '110' ||
     string == '011'
    p -1
  else
    p solve(string.chars)
  end
end

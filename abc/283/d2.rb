# frozen_string_literal: true

S = gets.chomp.chars
N = S.length

def build_map
  opens = []

  N.times.with_object({}) do |i, hash|
    case S[i]
    when '('
      opens << i
    when ')'
      hash[i] = opens.pop
    end
  end
end

current_box = Array.new(27)
box_histories = {}
paren_map = build_map

N.times do |i|
  case S[i]
  when '('
    box_histories[i] = current_box.dup
  when ')'
    current_box = box_histories[paren_map[i]]
  else
    k = S[i].ord - 'a'.ord

    if current_box[k]
      puts 'No'
      exit
    else
      current_box[k] = true
    end
  end
end

puts 'Yes'

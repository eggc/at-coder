# frozen_string_literal: true

N = gets.to_i
A = gets.split.map(&:to_i)
Q = gets.to_i
queries = $stdin.map { |line| line.split(' ').map(&:to_i) }

clear_value = -1
add_values = {}

queries.each do |query|
  case query[0]
  when 1
    clear_value = query[1]
    add_values = {}
  when 2
    index = query[1] - 1
    add_values[index] ||= 0
    add_values[index] += query[2]
  when 3
    index = query[1] - 1

    if clear_value > 0
      puts clear_value + (add_values[index] || 0)
    else
      puts A[index] + (add_values[index] || 0)
    end
  end
end

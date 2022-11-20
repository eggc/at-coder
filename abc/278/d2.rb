# frozen_string_literal: true

N = gets.to_i
A = gets.split.map(&:to_i)
Q = gets.to_i
queries = $stdin.map { |line| line.split(' ').map(&:to_i) }

head = 0
tail = -1
ignores = []

queries.each_with_index do |query, i|
  case query[0]
  when 1
    tail = i - 1
  when 3
    ignores.concat((head..tail).to_a) if tail > 0

    head = i + 1
    tail = -1
  end
end

ignore = ignores.shift

clear_value = -1
add_values = {}

queries.each_with_index do |query, i|
  if i == ignore
    ignore = ignores.shift
    next
  end

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

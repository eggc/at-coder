# frozen_string_literal: true

N = gets.to_i
A = gets.split.map(&:to_i)
Q = gets.to_i
queries = $stdin.map { |line| line.split(' ').map(&:to_i) }

ttl = {}

head = 0
tail = -1
ignores = []

queries.each_with_index do |query, i|
  case query[0]
  when 1
    tail = i - 1
  when 3
    index = query[1] - 1
    ttl[index] = i

    ignores.concat((head..tail).to_a) if tail > 0

    head = i + 1
    tail = -1
  end
end

ignore = ignores.shift

queries.each_with_index do |query, i|
  if i == ignore
    ignore = ignores.shift
    next
  end

  case query[0]
  when 1
    ttl.each_key { |key| A[key] = query[1] }
  when 2
    index = query[1] - 1
    A[index] += query[2]
  when 3
    index = query[1] - 1

    puts A[index]

    ttl.delete(index) if ttl[index] == i
  end
end

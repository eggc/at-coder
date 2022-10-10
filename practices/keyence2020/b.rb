# frozen_string_literal: true

N = gets.to_i
robots = $stdin.map do |line|
  xi, li = line.split.map(&:to_i)
  {
    head: xi - li,
    tail: xi + li
  }
end

robots.sort_by! { |x| x[:tail] }

p robots

answer = 0
current_head = -10**9

robots.each do |robot|
  if current_head <= robot[:head]
    answer += 1
    current_head = robot[:tail]
  end
end

puts answer

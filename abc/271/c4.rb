# frozen_string_literal: true

require 'set'

N = gets.to_i
A = gets.split.map(&:to_i)
A.sort!

volume_set = Set.new
sold = 0

A.each do |volume|
  if volume_set.include?(volume) || volume > N
    sold += 1
  else
    volume_set << volume
  end
end

current_volume = 1
largest_volume = N + 1

loop do
  current_volume += 1 while volume_set.include?(current_volume)
  largest_volume -= 1 while !volume_set.include?(largest_volume) && largest_volume > 0

  if sold >= 2
    sold -= 2
    volume_set << current_volume
  elsif current_volume >= largest_volume
    puts(current_volume - 1)
    exit
  else
    volume_set.delete(largest_volume)
    sold += 1
  end
end

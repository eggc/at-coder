# frozen_string_literal: true

N, M = gets.split.map(&:to_i)
k = []
x = []

M.times do
  kk, *xx = gets.split.map(&:to_i)
  k << kk
  x << xx
end

counter = {}

x.each do |row|
  row.combination(2) do |combi|
    counter[combi] ||= 0
    counter[combi] += 1
  end
end

(1..N).to_a.combination(2) do |combi|
  if counter[combi].nil?
    puts('No')
    exit
  end
end

puts 'Yes'

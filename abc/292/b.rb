N, Q = gets.split.map(&:to_i)

@cards = Array.new(N + 1, 0)

Q.times do
  type, x = gets.split.map(&:to_i)

  case type
  when 1
    @cards[x] += 1
  when 2
    @cards[x] += 2
  when 3
    puts(@cards[x] >= 2 ? 'Yes' : 'No')
  end
end

N = gets.to_i
cards = gets.split(" ").map(&:to_i)
cards = cards.sort_by {|x| -x }

alice = []
bob = []

cards.each_with_index do |card, i|
  if i.even?
    alice << card
  else
    bob << card
  end
end

puts(alice.sum - bob.sum)

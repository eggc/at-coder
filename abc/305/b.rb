# frozen_string_literal: true

p1, p2 = gets.split
p1, p2 = p2, p1 if p1 > p2

length = {}
length[%w[A B]] = 3
length[%w[B C]] = 1
length[%w[C D]] = 4
length[%w[D E]] = 1
length[%w[E F]] = 5
length[%w[F G]] = 9

puts (p1..p2).each_cons(2).sum {|x| length[x] }

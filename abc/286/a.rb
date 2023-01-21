N,P,Q,R,S = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

(Q-P+1).times do |i|
  i -= 1
  A[R+i], A[P+i] = A[P+i], A[R+i]
end

puts A.join(' ')

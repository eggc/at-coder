N, Q = gets.split.map(&:to_i)
L = []
A = []
N.times do
  length, *numbers = gets.split.map(&:to_i)
  L << length
  A << numbers
end

S = []
T = []
Q.times.map do
  s, t = gets.split.map(&:to_i)
  S << s
  T << t
end

Q.times do |i|
  puts A[S[i]-1][T[i]-1]
end

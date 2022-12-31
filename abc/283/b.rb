N = gets.to_i
A = gets.split.map(&:to_i)
Q = gets.to_i
queries = $stdin.map { |line| line.chomp.split(' ') }

queries.each do |args|
  type = args[0].to_i
  k = args[1].to_i - 1
  x = args[2]&.to_i

  case type
  when 1
    A[k] = x
  when 2
    puts A[k]
  end
end

N = gets.to_i
A = gets.split.map(&:to_i)

result = []

A.each_cons(2) do |a, b|
  loop do
    break if a == b

    result << a

    if a < b
      a += 1
    else
      a -= 1
    end
  end
end

result << A.last

puts result.join(' ')

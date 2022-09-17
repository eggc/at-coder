N = gets.to_i
P = gets.chomp.split(" ").map(&:to_i)


max_value = 0

N.times do |i|

  value = 0

  # 料理 p が人 k に届いた場合どうなるか？
  P.each_with_index do |target, j|
    receiver = (i + j) % N

    # print "料理 #{j} は目標 #{target} に対して #{receiver} が受け取った #{}"

    if target == (receiver - 1) % N ||
       target == receiver ||
       target == (receiver + 1) % N
      value += 1
    end
  end

  # puts "i: #{i}, value: #{value}"

  if max_value < value
    max_value = value
  end
end

puts max_value

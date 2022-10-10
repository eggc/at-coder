amount = gets.to_i

# お釣り
change = 1000 - amount
answer = 0

current_coin = 500

loop do
  if change >= current_coin
    change -= current_coin
    answer += 1
  else
    # お釣りを小さくする
    current_coin =
      case current_coin
      when 500
        100
      when 100
        50
      when 50
        10
      when 10
        5
      when 5
        1
      when 1
        break
      end
  end
end

puts answer

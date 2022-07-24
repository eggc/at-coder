A = gets.to_i
B = gets.to_i
C = gets.to_i
X = gets.to_i

class Counter
  def initialize
    @marked = {}
  end

  def count(coins)
    return 0 if @marked[coins]

    @marked[coins] = true
    sum = coins[0] * 500 + coins[1] * 100 + coins[2] * 50

    if sum > X
      0
    elsif sum == X
      1
    else
      parts = 0
      parts += count([coins[0] + 1, coins[1],     coins[2]])     if coins[0] < A
      parts += count([coins[0],     coins[1] + 1, coins[2]])     if coins[1] < B
      parts += count([coins[0],     coins[1],     coins[2] + 1]) if coins[2] < C
      parts
    end
  end
end

puts Counter.new.count([0, 0, 0])

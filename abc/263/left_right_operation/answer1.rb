N, L, R = gets.split(' ').map(&:to_i)
A = gets.split(' ').map(&:to_i)

def apply(items, replacer)
  best_profit = 0
  best_replace_index = -1
  current_sum = 0
  current_weight = 0

  items.each_with_index do |item, i|
    current_sum += item
    current_weight += replacer

    if current_sum - current_weight > best_profit
      best_profit = current_sum - current_weight
      best_replace_index = i
    end
  end

  (best_replace_index + 1).times do |i|
    items[i] = replacer
  end
end

def l_to_r(items)
  apply(items, L)
  items.reverse!
  apply(items, R)
  items.sum
end

def r_to_l(items)
  items.reverse!
  apply(items, R)
  items.reverse!
  apply(items, L)
  items.sum
end

puts([l_to_r(A.dup), r_to_l(A)].min)

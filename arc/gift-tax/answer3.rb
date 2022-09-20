N, A, B = gets.split(" ").map(&:to_i)
ITEMS = gets.split(" ").map(&:to_i)

# current が解としてあり得るか？
def can?(current)
  add_count = 0
  sub_count = 0

  ITEMS.each do |item|
    if item > current
      # 減算して良い回数(切り捨て)
      sub_count += (item - current) / B
    elsif item < current
      # 加算して良い回数(切り上げ)
      add_count += ((current - item) / A.to_f).ceil
    end
  end

  sub_count >= add_count
end

top = ITEMS.max
bottom = ITEMS.min
answer = bottom

while(top > bottom) do
  current = (top - bottom)/2 + bottom

  if can?(current)
    answer = current
    # より大きな値に挑戦
    bottom = current + 1
  else
    # より小さな値に挑戦
    top = current
  end
end

puts(answer)

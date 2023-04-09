# frozen_string_literal: true

N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
@list = []
current_max = 0

K.times do
  map = A.map do |a|
    if current_max < a
      a
    else
      target = current_max - a
      found = @list.bsearch { |x| x > target }
      found + a
    end
  end

  @list << map.min
  current_max = @list.last
end

p @list.last

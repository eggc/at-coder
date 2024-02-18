# frozen_string_literal: true

# imos法

T = gets.to_i
N = gets.to_i
R = N.times.map { gets.split.map(&:to_i) }

@imos = Array.new(T + 1, 0)

R.each do |left, right|
  @imos[left] += 1
  @imos[right] -= 1
end

@current = 0

T.times do |t|
  @current += @imos[t]
  puts @current
end

# frozen_string_literal: true

S = gets.chomp
N = gets.to_i
@answer = -1

def cmax(string)
  smax = string.gsub('?', '1').to_i(2)
  smin = string.gsub('?', '0').to_i(2)

  if smin > N
    -1
  elsif @answer > smax
    @answer
  elsif smax <= N
    @answer = smax
  else
    search(string)
  end
end

def search(string)
  unless string.include?('?')
    ans = string.to_i(2)
    return ans > N ? -1 : ans
  end

  [
    cmax(string.sub('?', '1')),
    cmax(string.sub('?', '0'))
  ].max
end

puts search(S)

S = gets.chomp
T = gets.chomp

sdash = S[-T.length..].chars
unmatch = {}

T.each_char.with_index.each do |t, i|
  if t == '?' || t == sdash[i] || sdash[i] == '?'
    # do nothing
  else
    unmatch[i] = true
  end
end

puts unmatch.empty? ? 'Yes' : 'No'

T.length.times do |x|
  sdash[x] = S[x]
  unmatch.delete(x)

  if T[x] == '?' || T[x] == sdash[x] || sdash[x] == '?'
    # do nothing
  else
    unmatch[x] = true
  end

  puts unmatch.empty? ? 'Yes' : 'No'
end

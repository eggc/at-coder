S = gets.split.map(&:to_i)

if (S.sort == S) &&
   (S.all? { |x| x >= 100 && x <= 675 }) &&
   (S.all? { |x| x % 25 == 0 })
  puts 'Yes'
else
  puts 'No'
end

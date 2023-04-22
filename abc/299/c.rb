N = gets.to_i
S = gets.chomp

dangos = S.split('-')
size = dangos.map(&:length).max

if size == nil || size == 0 || !S.include?('-')
  puts -1
else
  puts size
end

N = gets.to_i
WORDS = gets.split(' ')

if WORDS.include?('and') ||
   WORDS.include?('not') ||
   WORDS.include?('that') ||
   WORDS.include?('the') ||
   WORDS.include?('you')
  puts 'Yes'
else
  puts 'No'
end

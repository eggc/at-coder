WORDS = %w(dream dreamer erase eraser)
S = gets.chomp

def find(goal)
  return true if goal.empty?

  WORDS.any? do |word|
    goal.length >= word.length &&
      goal.start_with?(word) &&
      find(goal[(word.length)..-1])
  end
end

puts(find(S) ? 'YES' : 'NO')

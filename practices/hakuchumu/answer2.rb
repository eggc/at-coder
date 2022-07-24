WORDS = %w(dream dreamer erase eraser)
GOAL = gets.chomp

def find
  queue = [GOAL.length - 1]

  while queue.length > 0
    tail = queue.pop
    return true if tail == -1

    WORDS.any? do |word|
      if GOAL[0..tail].end_with?(word)
        queue.push(tail - word.length)
      end
    end
  end

  false
end

puts(find ? 'YES' : 'NO')

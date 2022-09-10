S = gets.chomp.split("").map { |i| i == "1" }
S.unshift(-1)
INDEXES = [7, 4, 8, 2, 5, 1, 9, 3, 6, 10].map { |i| S[i] }

def yes!
  puts("Yes")
  exit
end

if S[1]
  puts("No")
  exit
end

if !S[4]
  if INDEXES[0..0].any? && INDEXES[2..].any?
    yes!
  end
end

if !S[8] && !S[2]
  if INDEXES[0..1].any? && INDEXES[4..].any?
    yes!
  end
end

if !S[5] && !S[1]
  if INDEXES[0..3].any? && INDEXES[6..].any?
    yes!
  end
end

if !S[9] && !S[3]
  if INDEXES[0..5].any? && INDEXES[7..].any?
    yes!
  end
end

if !S[6]
  if INDEXES[0..7].any? && INDEXES[9..].any?
    yes!
  end
end

puts("No")

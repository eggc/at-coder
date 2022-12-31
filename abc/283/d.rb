S = gets.chomp.chars
N = S.length

# 最初にカッコの対応マップを完成させる
def build_map
  stack = []
  opens = []

  N.times do |i|
    case S[i]
    when '('
      stack << [:open, i, stack.last&.at(1) || -1]
    when ')'
      stack << [:close, i]
    end
  end

  stack.each do |args|
    if args[0] == :open
      opens << args[1]
    else
      args << opens.pop
    end
  end

  hash = {}

  stack.each do |_type, a, b|
    hash[a] = b
  end

  hash
end

box = {}
paren_map = build_map
snapshot = {}

N.times do |i|
  case S[i]
  when '('
    snapshot[i] = box.dup
  when ')'
    snapshot[i] = box.dup
    j = paren_map[paren_map[i]]
    box = snapshot[j] || {}
  else
    if box[S[i]]
      puts "No"
      exit
    else
      box[S[i]] = true
    end
  end
end

puts "Yes"

N = gets.to_i
HINT = {}

def ask(u, v)
  # 強制的に u < v にする
  v, u = u, v if u > v

  return 0 if u == v
  return HINT[[u, v]] if HINT[[u, v]]

  puts("? #{u} #{v}")
  $stdout.flush
  answer = gets.to_i

  debug("? ANSWER= #{answer}")

  if answer == -1
    exit -1
  else
    answer
  end
end

def final_answer(length)
  puts "! #{length}"
  exit
end

def debug(message)
  puts message if ENV['DEBUG']
end

(3..N).each do |i|
  HINT[[1,i]] = ask(1, i)
end

if HINT.all? { |_, k| k == 2 }
  final_answer(1)
end

_, current_length = HINT.max

loop do
  debug("長さ #{current_length.to_s} との関係を調べてみるね")

  selected = HINT.select { |_, length| length == current_length }
  selected.each do |(u, v), _|
    HINT[[2,v]] = ask(2, v)
  end

  (_, stone), _ = HINT.find { |(u, v), length| u == 2 && length == 1 }

  if stone
    debug("もうすぐ答え出せそう d(2,#{stone}) = 1 がわかったよ。2 が #{stone} の後ろか前か調べよう。")

    if ask(stone, 1) == 1
      # 後ろにつくしかない
      final_answer(2)
    else
      # stone と距離1のノードが存在する？
      exist = HINT.any? do |(u, v), length|
        u == 1 &&
          length == (current_length-1) &&
          ask(stone, v) == 1
      end

      if exist
        final_answer(current_length+1)
      else
        final_answer(current_length-1)
      end
    end
  else
    current_length -= 1

    if current_length == 1
      final_answer(1)
    end
  end
end

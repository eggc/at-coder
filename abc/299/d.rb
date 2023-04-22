# frozen_string_literal: true

N = gets.to_i

def question(i)
  puts("? #{i}")
  $stdout.flush
  gets.to_i
end

def answer(p)
  puts("! #{p}")
  exit
end

def middle(range)
  # あまりは切りすてる。例：range(1..3) => 2
  range.first + range.size / 2
end

def search(range)
  if range.size == 2
    answer(range.first)
  elsif range.size == 3
    m = middle(range)
    result = question(m)
    if result == 1
      answer(range.first)
    else
      answer(range.first + 1)
    end
  end

  m = middle(range)
  result = question(m)

  case result
  when 0
    # 後半を探索
    search(m..(range.last))
  when 1
    # 前半を探索
    search((range.first)..m)
  else
    raise
  end
end

puts search(1..N)

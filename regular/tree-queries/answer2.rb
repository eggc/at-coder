N = gets.to_i

def ask(u, v)
  puts("? #{u} #{v}")
  $stdout.flush
  answer = gets.to_i

  if answer == -1
    exit(-1)
  else
    answer
  end
end

def final_answer(length)
  puts "! #{length}"
  exit
end

distances = {}

(3..N).each do |i|
  distances[i] = ask(1, i) + ask(2, i)
end

minimum = distances.values.min

if minimum == 3
  selected = distances.select { |_,v| v == 3 }

  if selected.length == 2 && ask(*selected.keys) == 1
    final_answer(3)
  else
    final_answer(1)
  end
else
  final_answer(minimum)
end

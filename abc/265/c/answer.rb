require "set"

H, W = gets.chomp.split(" ").map(&:to_i)
G = H.times.map { gets.chomp.split("") }

# 添字の調整
G.unshift([])
G.each { |row| row.unshift(-1) }

def ppp(obj, label = '')
  return unless ENV['DEBUG']

  if label
    puts("====== #{label} =========================")
  end

  if obj.is_a?(Array) && obj[0].is_a?(Array)
    puts(obj.map { |row| row.join(", ") }.join("\n"))
  elsif obj.is_a?(Array)
    puts(obj.join(", "))
  else
    puts(obj)
  end
end

i = 1
j = 1

# 同じマスを踏んだら無限ループするので踏んだマスは Set で記憶してみる
route = Set.new

loop do
  if route.include?([i,j])
    puts "-1"
    exit
  else
    route << [i,j]
  end

  case G[i][j]
  when 'U'
    if i != 1
      i -= 1
    else
      break
    end
  when 'D'
    if i != H
      i += 1
    else
      break
    end
  when 'L'
    if j != 1
      j -= 1
    else
      break
    end
  when 'R'
    if j != W
      j += 1
    else
      break
    end
  end
end

puts "#{i} #{j}"

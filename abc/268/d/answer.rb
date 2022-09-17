N, M = gets.chomp.split(" ").map(&:to_i)
S = N.times.map { gets.chomp }

NG_LIST = {}
M.times { NG_LIST[gets.chomp] = true }

def build_names(targets)
  if targets.length == 1
    name = targets.first

    if NG_LIST[name] || name.length < 3 || name.length > 16
      return []
    else
      return targets
    end
  end

  current_length = targets.sum { |x| x.length } + targets.length - 2

  a, b, *rest = targets
  result = []

  14.times do |i|
    break if current_length + i + 1 > 16

    next_target = [[a, b].join("_" * (i + 1)), *rest]

    result.concat(build_names(next_target))
  end

  result
end

S.permutation do |targets|
  build_names(targets).each do |name|
    puts name
    exit
  end
end

puts "-1"

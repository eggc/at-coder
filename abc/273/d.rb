require "set"

H, W, rs, cs = gets.split.map(&:to_i)

N = gets.to_i

walls = N.times.map { gets.split.map(&:to_i) }
index_walls_i = walls.group_by { |i, j| i }.transform_values { |v| v.map(&:last).sort }
index_walls_j = walls.group_by { |i, j| j }.transform_values { |v| v.map(&:first).sort }

Q = gets.to_i
queries = Q.times.map do
  query = gets.chomp.split
  query[1] = query[1].to_i
  query
end

def move_to(rs, cs, direction, length)
  case direction
  when 'L'
    block = index_walls_j[cs].bsearch { |x| x >= rs && x <= rs - length }
    if block.nil?
      [rs - length, cs]
    else
      [block - 1, cs]
    end
  when 'R'
    block = index_walls_j[cs].bsearch { |x| x >= rs && x <= rs + length }
    if block.nil?
      [rs + length, cs]
    else
      [block + 1, cs]
    end
  when 'U'
    block = index_walls_i[rs].bsearch { |x| x >= cs && x <= cs + length }
    if block.nil?
      [rs + length, cs]
    else
      [block + 1, cs]
    end
  when 'D'

  end

end



while queries.size > 0
  direction, length = queries.shift
  rs, cs = move_to(rs, cs, direction, length)

  puts "#{rs} #{cs}"
end

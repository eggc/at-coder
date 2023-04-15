N = gets.to_i

A = N.times.map {  gets.chomp.split(' ').map(&:to_i) }
B = N.times.map {  gets.chomp.split(' ').map(&:to_i) }

def rotation(table)
  new_table = Array.new(N) { [] }

  N.times do |i|
    N.times do |j|
      new_table[i][j]= table[N-j-1][i]
    end
  end

  new_table
end

def match?(tablea, tableb)
  success = true

  N.times do |i|
    N.times do |j|
      if tablea[i][j] == 1
        if tableb[i][j] == 1
          # ok
        else
          success = false
        end
      end
    end
  end

  success
end


current_table = A

4.times do
  if match?(current_table, B)
    puts 'Yes'
    exit
  end
  current_table = rotation(current_table)
end

puts 'No'

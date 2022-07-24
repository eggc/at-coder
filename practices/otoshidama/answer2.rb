INPUTS = gets.split(' ').map(&:to_i)
N = INPUTS[0]
Y = INPUTS[1] / 1000

class Solver
  def initialize
    @table = build_table
  end

  def to_s
    @table.map.with_index { |row, i| "#{i} | " + row&.join(",") }
  end

  private

  def build_table
    n = 0
    table = [[1, 5, 10]]

    while(n < Y) do
      if table[n]
        x, y, z = table[n]

        table[n+1] = [x + 1, x + 5, x + 10]
        table[n+5] = [y + 1, y + 5, y + 10]
        table[n+10] = [z + 1, z + 5, z + 10]
      end

      n += 1
    end

    table
  end
end

puts Solver.new.to_s

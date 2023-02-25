# frozen_string_literal: true

class TableInspector
  COLUMN_WIDTH = 5

  class << self
    def inspect(table)
      str = header(table)
      table.size.times { |i| str << row(table[i], i) }
      str
    end

    private

    def row(table_row, i)
      str = cell(i)
      str << ' | '
      table_row.each { |value| str << cell(value) }
      str << "\n"
    end

    def header(table)
      width = table[0].size
      str = row(0..width, 'i\j')
      str << '-' * COLUMN_WIDTH << '-+-' << '-' * (COLUMN_WIDTH * 10)
      str << "\n"
    end

    def cell(value)
      format("%#{COLUMN_WIDTH}s", value)
    end
  end
end

class DynamicProgramming
  def initialize(height, width)
    @width = width
    @height = height
    @table = Array.new(@height) { Array.new(@width) }
  end

  def fill
    @height.times do |i|
      @width.times do |j|
        @table[i][j] = create_value(i, j)
      end
    end
  end

  def inspect
    TableInspector.inspect(@table)
  end

  def [](i, j = nil)
    if j.nil?
      @table[i]
    else
      @table[i][j]
    end
  end

  private

  def create_value(i, j)
    if i == 0 && j == i
      0
    elsif i == 0
      @table[0][j] = B[M - j] - @table[0][j - 1]
    elsif j == 0
      @table[i][0] = A[N - i] - @table[i - 1][0]
    else
      @table[i][j] = [
        A[N - i] - @table[i - 1][j],
        B[M - j] - @table[i][j - 1]
      ].max
    end
  end
end

N, M = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
B = gets.split.map(&:to_i)

@dp = DynamicProgramming.new(N + 1, M + 1)
@dp.fill
p @dp

puts (@dp[N][M] + A.sum + B.sum) / 2

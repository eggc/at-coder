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
      str = row(0...width, 'i\j')
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
    if i == 0
      1
    else
      target = j == 0 ? A[i] : B[i]

      result = 0
      result += @table[i - 1][0] if A[i - 1] != target
      result += @table[i - 1][1] if B[i - 1] != target
      result % 998_244_353
    end
  end
end

N = gets.to_i
A, B = N.times.map { gets.split.map(&:to_i) }.transpose

@dp = DynamicProgramming.new(N, 2)
@dp.fill
puts(@dp[-1].sum % 998_244_353)

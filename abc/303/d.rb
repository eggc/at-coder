# frozen_string_literal: true

X, Y, Z = gets.split.map(&:to_i)
S = gets.chomp

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

  def answer
    @table.last.min
  end

  private

  def create_value(i, j)
    if i == 0
      j == 0 ? 0 : Z
    elsif j == 0
      if S[i - 1] == 'a'
        [
          @table[i - 1][0] + X,
          @table[i - 1][1] + Z + X
        ].min
      else
        [
          @table[i - 1][0] + Y,
          @table[i - 1][1] + Z + Y
        ].min
      end
    elsif S[i - 1] == 'a'
      [
        @table[i - 1][0] + Z + Y,
        @table[i - 1][1] + Y
      ].min
    else
      [
        @table[i - 1][0] + Z + X,
        @table[i - 1][1] + X
      ].min
    end
  end
end

dp = DynamicProgramming.new(S.length + 1, 2)
dp.fill

p dp.answer
# puts dp.inspect

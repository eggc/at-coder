# frozen_string_literal: true
N = gets.to_i
P = gets.split.map(&:to_i)
P.unshift(0)

class DPInspector
  def self.inspect(dp)
    String.new.tap do |str|
      dp.height.times do |i|
        str << format('%4d ', i)

        dp.width.times do |j|
          str << inspect_cell(dp.table[i][j]) << ' '
        end

        str << "\n"
      end
    end
  end

  def self.inspect_cell(value)
    if value == true
      'o'
    elsif value
      format('%4d', value)
    else
      '-'
    end
  end
end

class DynamicProgramming
  attr_reader :table, :width, :height

  def initialize(height, width)
    @width = width
    @height = height
    @table = Array.new(@height) { Array.new(@width) }
  end

  def fill
    @height.times do |i|
      @width.times do |j|
        @table[i][j] = create_next_value(i, j)
      end
    end
  end

  def inspect
    DPInspector.inspect(self)
  end

  private

  def create_next_value(i, j)
    j == 0 ||
      P[i] == j ||
      @table[i - 1][j] ||
      @table[i - 1][j - P[i]]
  end
end

@dp = DynamicProgramming.new(N + 1, P.sum + 1)
@dp.fill

p @dp

puts @dp.table.last.count(&:itself)

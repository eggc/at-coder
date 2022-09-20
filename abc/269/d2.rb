# frozen_string_literal: true

require 'set'

N = gets.to_i
LIST = N.times.map { gets.chomp.split(' ').map(&:to_i) }

class Painter
  def initialize(cells)
    @cells = cells.to_set
    @colors = {}
  end

  def solve
    @cells.each_with_index do |current_step, i|
      paint(i, current_step)
    end

    @colors.group_by { |_k, v| v }.count
  end

  private

  # 6角形グリッドのあるマス (x, y) から到達可能なマスを返す
  def neighbors(args)
    x, y = args

    [
      [x - 1, y - 1],
      [x - 1, y],
      [x, y - 1],
      [x, y + 1],
      [x + 1, y],
      [x + 1, y + 1]
    ].to_set
  end

  def paint(color, current_step)
    return if @colors[current_step]

    @colors[current_step] = color

    next_steps = (@cells & neighbors(current_step))
    next_steps.each do |step|
      paint(color, step)
    end
  end
end

painter = Painter.new(LIST)
puts(painter.solve)

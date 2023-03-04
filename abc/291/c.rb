require 'set'

N = gets.to_i
S = gets.chomp

@history = Set.new
@history << [0, 0]
@current = [0, 0]

def move(c)
  case c
  when 'R'
    @current[0] += 1
  when 'L'
    @current[0] -= 1
  when 'U'
    @current[1] += 1
  when 'D'
    @current[1] -= 1
  end
end

S.each_char do |c|
  move(c)

  if @history.include?(@current)
    puts "Yes"
    exit
  else
    @history << @current.dup
  end
end

puts "No"

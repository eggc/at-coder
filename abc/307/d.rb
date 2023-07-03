N = gets.to_i
S = gets.chomp.chars

@stack = []
@hint = Array.new(N)

N.times do |i|
  if S[i] == '('
    @stack << i
  elsif S[i] == ')'
    open_index = @stack.pop

    if open_index
      @hint[open_index] = i
    end
  end
end

i = 0

N.times do
  if @hint[i]
    i = @hint[i]
  else
    print S[i]
  end

  i += 1
end

puts

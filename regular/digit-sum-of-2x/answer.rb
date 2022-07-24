N = gets.to_i

puts(N*2)

suffix = '4' * (N / 4)

if (N % 4) == 0
  puts(suffix)
else
  puts((N % 4).to_s + suffix)
end

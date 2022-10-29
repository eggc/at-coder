N = gets.to_i

def func(n)
  if n == 0
    1
  else
    n * func(n-1)
  end
end

puts func(N)

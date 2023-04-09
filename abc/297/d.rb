A, B = gets.split.map(&:to_i)

def step(a, b)
  a, b = b, a if a > b

  mod = b % a

  if mod == 0
    b / a - 1
  else
    b / a + step(mod, a)
  end
end

p step(A, B)

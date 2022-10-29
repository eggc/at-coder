N = gets.to_i
A = gets.split.map{ |x| x.to_i - 1 }

amebas = Array.new(N * 2 + 1, 0)

N.times do |i|
  amebas[2*i + 1] = amebas[A[i]] + 1
  amebas[2*i + 2] = amebas[A[i]] + 1
end

puts amebas.join("\n")

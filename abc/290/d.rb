def solve(n, d, k)
  k -= 1
  a = n / n.gcd(d)

  if n.gcd(d) >= 2
    x = k / a
    ((d * k) % n) + x
  else
    ((d * k) % n)
  end
end

gets.to_i.times do
  n,d,k = gets.split.map(&:to_i)
  puts solve(n,d,k)
end

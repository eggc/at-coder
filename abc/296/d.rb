require 'prime'

N, M = gets.split.map(&:to_i)

answer = nil
answer = M if N >= M

answer ||= if M.prime?
             M + 1
           else
             M
           end

primes = answer.prime_division
zzz = 1
primes[1..].each { |x| zzz *= x[0] }

if (primes.first[0] * primes.last[0]) > N && zzz > N
  puts(-1)
else
  puts(answer)
end

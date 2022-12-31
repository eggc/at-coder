N, M = gets.split.map(&:to_i)
S = $stdin.map { |line| line.chomp.split('') }

answer = 0

N.times do |i1|
  N.times do |i2|
    next if i1 >= i2

    # i1, i2 がペアを作った場合全部の問題が解けるか？
    if M.times.all? { |j| S[i1][j] == 'o' || S[i2][j] == 'o' }
      answer += 1
    end
  end
end

puts answer

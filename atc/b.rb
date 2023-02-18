# frozen_string_literal: true

N, Q = gets.split.map(&:to_i)

@parents = []

def root(a)
  if @parents[a]
    @parents[a] = root(@parents[a])
  else
    a
  end
end

def unite(a, b)
  root_a = root(a)
  root_b = root(b)

  return if root_a == root_b

  @parents[root_a] = root_b
end

def same?(a, b)
  puts root(a) == root(b) ? 'Yes' : 'No'
end

$stdin.map do |line|
  p, a, b = line.chomp.split.map(&:to_i)

  if p == 0
    unite(a, b)
  else
    same?(a, b)
  end
end

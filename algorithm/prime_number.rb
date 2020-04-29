# 与えられた数が素数かどうか調べる
# あるいは与えられた数までの素数を列挙する

def prime_number?(n)
  return false if n < 1
  return false if n == 1
  return true if n == 2
  return false if n % 2 == 0

  a = 3
  while a <= n ** 0.5
    return false if n % a == 0
    a += 2
  end

  true
end

def prime_numbers
  (1..100000).select { |n| prime_number?(n) }
end

puts prime_numbers.join(' ')

# 1から順番に数を表示する
# その数が3で割り切れるなら"Fizz"、5で割り切れるなら"Buzz"、両方で割り切れるなら"FizzBuzz"と表示する

def fizz_buzz(n)
  ret = "#{['Fizz'][n % 3]}#{['Buzz'][n % 5]}"
  ret.empty? ? n.to_s : ret
end

puts (1..100).collect { |n| fizz_buzz(n) }

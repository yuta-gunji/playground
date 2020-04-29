# Hello World![改行]を5回表示させてください。 print(或いはprintf,cout等)を5回コピーすれば当然可能ですが、
# ループ構文(for,while等)を利用して、print等は1回の使用にとどめてみてください。

i = 1
number = gets.strip.to_i

while i <= number do
  puts "Hello world!"
  i += 1
end

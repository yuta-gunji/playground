# 与えられたn枚の円盤を用いたハノイの塔を再帰的アルゴリズムを用いて解くプログラムを作成せよ。
# 出力は円盤の移動の記録及び手数とする。

@cnt = 1

def hanoi(n, start, goal, tmp)
  return if n == 0

  hanoi(n - 1, start, tmp, goal)
  puts "#{@cnt}: Move #{n} #{start} => #{goal}"
  @cnt += 1
  hanoi(n - 1, tmp, goal, start)
end

num = gets.strip.to_i
hanoi(num, 'A', 'B', 'C')

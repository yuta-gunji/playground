require "pry"

# 解法1
class KaraokeMachine
  KEYS = %w(C C# D D# E F F# G G# A A# B).freeze

  def initialize(melody)
    @melody = melody
  end

  def transpose(amount)
    # 変換するためのハッシュ
    converter = [KEYS, KEYS.rotate(amount)].transpose.to_h
    @melody.gsub(/[A-G]#?/, converter)
  end
end

# 解法2
class KaraokeMachine
  KEYS = %w(C C# D D# E F F# G G# A A# B).freeze

  def initialize(melody)
    @melody = melody
  end

  def transpose(amount)
    @melody.gsub(/[A-G]#?/) { |key| KEYS[(KEYS.index(key) + amount) % 12] }
  end
end

# frozen_string_literal: true

require 'pry'

class Bingo
  FORMAT = Array.new(5, '%2s').join(' | ')

  def self.generate_card
    ['BINGO'.chars, *numbers].map { |row|
      FORMAT % row
    }.join("\n")
  end

  def self.numbers
    (1..75).each_slice(15)
      .map { |sequence| sequence.sample(5) }
      .tap { |table| table[2][2] = '' }
      .transpose
  end
end

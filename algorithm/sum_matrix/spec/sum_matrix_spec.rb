# frozen_string_literal: true

require 'spec_helper'
require 'pry'

RSpec.describe SumMatrix do
  example 'sum_matrix' do
    input = [
      [9, 85, 92, 20],
      [68, 25, 80, 55],
      [43, 96, 71, 73],
      [43, 19, 20, 87],
      [95, 66, 73, 62]
    ]
    expected = [
      [9, 85, 92, 20, 206],
      [68, 25, 80, 55, 228],
      [43, 96, 71, 73, 283],
      [43, 19, 20, 87, 169],
      [95, 66, 73, 62, 296],
      [258, 291, 336, 297, 1182]
    ]

    expect(SumMatrix.sum_matrix(input)).to eq expected
  end

  example 'format_matrix_max_400' do
    input = [
      [1, 2, 3, 4],
      [100, 200, 300, 400]
    ]

    expected = <<~TEXT.chomp
        1|  2|  3|  4
      100|200|300|400
    TEXT

    expect(SumMatrix.format_matrix(input)).to eq expected
  end

  example 'format_matrix_max_40' do
    input = [
      [1, 2, 3, 4],
      [10, 20, 30, 40]
    ]

    expected = <<~TEXT.chomp
       1| 2| 3| 4
      10|20|30|40
    TEXT

    expect(SumMatrix.format_matrix(input)).to eq expected
  end

  example 'generate_matrix' do
    matrix = SumMatrix.generate_matrix(col: 4, row: 5, number_range: 1..99)
    expect(matrix.size).to eq 5
    expect(matrix.all? { |row| row.size == 4 }).to be_truthy
    expect(matrix.flatten.all? { |n| n.between?(1, 99) }).to be_truthy

    matrix2 = SumMatrix.generate_matrix(col: 4, row: 5, number_range: 1..99)
    expect(matrix != matrix2).to be_truthy
  end

  example 'generate_sum_matrix' do
    result = SumMatrix.generate_sum_matrix
    puts result
    expect(result.is_a?(String)).to be_truthy
  end
end

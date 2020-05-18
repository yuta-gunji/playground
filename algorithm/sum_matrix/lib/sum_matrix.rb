# frozen_string_literal: true

module SumMatrix
  module_function

  def sum_matrix(matrix)
    matrix
      .map { |row| [*row, row.inject(:+)] }
      .transpose
      .map { |row| [*row, row.inject(:+)] }
      .transpose
  end

  def generate_matrix(col: 4, row: 5, number_range: 1..99)
    Array.new(row) { number_range.to_a.sample(col) }
  end

  def format_matrix(matrix)
    size = matrix.last.max.to_s.size
    matrix.map { |row| format_row(row, size) }.join("\n")
  end

  def format_row(row, size)
    format = Array.new(row.size, "%#{size}s").join('|')
    format % row
  end

  def generate_sum_matrix(col: 4, row: 5, number_range: 1..99)
    matrix = generate_matrix(col: col, row: row, number_range: number_range)
    format_matrix(sum_matrix(matrix))
  end
end

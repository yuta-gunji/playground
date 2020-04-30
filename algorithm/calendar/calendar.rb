require 'date'

class MonthlyCalendar
  WEEK = %w[Su Mo Tu We Th Fr Sa].freeze

  def initialize(year:, month:)
    @first_date = Date.new(year, month)
    @last_date = @first_date.next_month.prev_day
  end

  attr_reader :first_date, :last_date

  def calendar
    [
      first_date.strftime("%B %Y").center(20),
      WEEK.join(' '),
      weeks.map { |week| week.join(' ') },
    ]
  end

  private

  def first_day
    first_date.day
  end

  def last_day
    last_date.day
  end

  def first_wday
    first_date.wday
  end

  def last_wday
    last_date.wday
  end

  def weeks
    days = (first_day..last_day).map { |day| day.to_s.rjust(2) }
    weeks = Array.new(first_wday, ' ' * 2).push(*days).each_slice(7).to_a
  end
end

def main
  year = Date.today.year
  (1..12).each do |n|
    puts '-' * 20
    monthly_calendar = MonthlyCalendar.new(year: year, month: n)
    puts monthly_calendar.calendar
  end
end

if __FILE__ == $0
  main
end

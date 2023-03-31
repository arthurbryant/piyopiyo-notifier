# frozen_string_literal: true

require_relative 'piyopiyo'
require_relative 'day_filter'
require_relative 'jp_holiday_generator'

def notify(event:, context:)
  all_available_days = Piyopiyo.get_all_available_days
  jp_holidays = JpHolidayGenerator.generate
  # filter for 土日祝
  desired_off_days = ['（土）', '（日）'] + jp_holidays
  messages = DayFilter.filter_by_day(all_available_days, desired_off_days)
  if messages.empty?
    puts 'No available days found. Do nothing!'
  else
    puts "send messages"
  end
end

__FILE__ == $0 ? (ap notify) : nil

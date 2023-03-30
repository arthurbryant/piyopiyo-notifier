require 'holiday_jp'
require 'active_support/time'
require 'awesome_print'

class JpHolidayGenerator
  def self.generate
    # show the holidays in one month
    HolidayJp.between(Time.now, 1.month.from_now).map do |holiday|
      holiday.date.strftime('%Y年%m月%d日')
    end
  end
end

if __FILE__ == $0
  ap JpHolidayGenerator.generate
end

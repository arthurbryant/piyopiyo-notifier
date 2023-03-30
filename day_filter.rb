require 'awesome_print'

class DayFilter
  def self.filter_by_day(all_available_days, desired_off_days)
    all_available_days.select { |d| desired_off_days.any? { |desired_off_day| d.include?(desired_off_day) } }
  end
end

if __FILE__ == $0
  # style the following string to be an array of strings
  data = "2023年04月01日（土） 1枠は△ です
          2023年04月08日（土） 3枠は△ です
          2023年04月12日（水） 1枠は△ です
          2023年04月12日（水） 3枠は△ です
          2023年04月18日（火） 3枠は○ です
          2023年04月19日（水） 3枠は△ です
          2023年04月20日（木） 3枠は○ です
          2023年04月21日（金） 3枠は△ です
          2023年04月24日（月） 1枠は○ です
          2023年04月24日（月） 3枠は○ です
          2023年04月25日（火） 1枠は○ です
          2023年04月25日（火） 3枠は○ です
          2023年04月26日（水） 1枠は△ です
          2023年04月26日（水） 3枠は○ です
          2023年04月27日（木） 1枠は○ です
          2023年04月27日（木） 3枠は○ です
          2023年04月28日（金） 1枠は△ です
          2023年04月28日（金） 3枠は○ です
          2023年04月30日（日） 1枠は○ です"
  all_available_days = data.split("\n")
  ap all_available_days

  ap DayFilter.filter_by_day(all_available_days, ['（土）', '（日）'])
end

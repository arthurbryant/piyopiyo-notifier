# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'
require 'awesome_print'

class Piyopiyo
  def initialize
    @url = 'https://www.nerima-piyopiyo.com/piyopiyo/useddate/select/01.html'
  end

  # get all available days from the webpage
  def get_all_available_days
    all_available_days = []

    doc = Nokogiri::HTML(open(@url))
    doc.css('td').each_slice(4) do |slice|
      dt = slice.shift.text.gsub(/\s+/, '')
      marks = slice.map { |td| td.text.gsub(/\s+/, '') }
      marks.each_with_index do |m, index|
        if (m == '○') || (m == '△')
          all_available_days << dt + ' ' + (index + 1).to_s + '枠は' + m + ' です'
        end
      end
    end

    all_available_days
  end
end

# execute the script
if __FILE__ == $0
  p = Piyopiyo.new
  ap p.get_all_available_days
end

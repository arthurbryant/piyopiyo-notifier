require 'nokogiri'
require 'open-uri'

# get all the available days from the webpage
def get_available_days
  doc = Nokogiri::HTML(open('https://www.nerima-piyopiyo.com/piyopiyo/useddate/select/01.html'))
  doc.css('td').each_slice(4) do |slice|
    dt = slice.shift.text.gsub(/\s+/, "")
    marks = slice.map { |td| td.text.gsub(/\s+/, "") }
    marks.each_with_index do |m, index|
      if m == '○' or m == '△'
        puts dt + " " + (index + 1).to_s + "枠は" + m + " です"
      end
    end
  end
end

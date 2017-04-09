require "nokogiri"
require "open-uri"

url = 'http://1000mostcommonwords.com/1000-most-common-russian-words/'

doc = Nokogiri::HTML(open url)

doc.css('tr').each do |tr|
  original_text = tr.css('td:nth-child(2)').text
  translated_text = tr.css('td:nth-child(3)').text

  puts "#{original_text}: #{translated_text}"

  Card.create(
  original_text: original_text,
  translated_text: translated_text,
  review_date: 3.days.from_now
  )
end
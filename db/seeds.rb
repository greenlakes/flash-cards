# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'rubygems'
require 'nokogiri'   
require 'open-uri'
page = Nokogiri::HTML(open("http://iloveenglish.ru/stories/view/basic_english_ch_2_850_samikh_neobkhodimikh_anglijskikh_slov"))   
puts page.css('div#wrapper div#page.clearfix div.content-wrapper div.content div.story-content table tbody tr td').each do |el|
  Card.create(original_text: el.first, translated_text: el.next_element)
end
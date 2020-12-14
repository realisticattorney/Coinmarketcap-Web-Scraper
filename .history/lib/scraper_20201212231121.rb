require 'HTTParty'
require 'Nokogiri'

class Scraper
   def initialize
   doc = HTTParty.get("https://www.nike.com/ar/")
   @parse_page ||= Nokogiri::HTML(doc)
   end
   
end
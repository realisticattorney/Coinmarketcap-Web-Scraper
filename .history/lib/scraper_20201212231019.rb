require 'HTTParty'
require 'Nokogiri'

class Scraper
   doc = HTTParty.get("https://www.nike.com/ar/")
   @parse
end
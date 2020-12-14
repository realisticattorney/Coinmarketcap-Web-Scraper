require 'HTTParty'
require 'Nokogiri'
require 'byebug'


def scraper
   url = "https://www.dexter.com.ar" # URL we want to target
   unparsed_page = HTTParty.get(url) # get request to that URL whick gives back the raw HTML
   parsed_page = Nokogiri::HTML(unparsed_page)# nokogiri parses that HTML into a format from where we can extract data out of
   byebug
   return nil if body.nil? 
   return nil if body == nil 
end

scraper













# class Scraper
   
#    attr_accessor :parse_page

#    def initialize
#    doc = HTTParty.get("https://www.dexter.com.ar/marcas/nike/nike-icon-clash?mi=hm_f1_laniconclash_200926&psn=Full_1")
#    @parse_page ||= Nokogiri::HTML(doc)
#    end

#    names = parse_page.css("link")
   
# end
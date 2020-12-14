

class Scraper
   
   attr_accessor :parse_page

   def initialize
   doc = HTTParty.get("https://www.dexter.com.ar/marcas/nike/nike-icon-clash?mi=hm_f1_laniconclash_200926&psn=Full_1")
   @parse_page ||= Nokogiri::HTML(doc)
   end

   names = parse_page.css("link")
   
end
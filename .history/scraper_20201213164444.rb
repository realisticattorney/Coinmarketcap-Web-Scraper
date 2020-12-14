require 'HTTParty'
require 'Nokogiri'
require 'byebug'


def scraper
   url = "https://coinmarketcap.com/" # URL we want to target
   unparsed_page = HTTParty.get(url) # get request to that URL whick gives back the raw HTML
   parsed_page = Nokogiri::HTML(unparsed_page)# nokogiri parses that HTML into a format from where we can extract data out of
   byebug
end

scraper











# bitcoin_table = parsed_page.css('html.js-focus.visible>body>div#container>div.row>div-col-12>div#btcExchangesTable_wrapper.dataTables_wrapper.no-footer')


# class Scraper
   
#    attr_accessor :parse_page

#    def initialize
#    doc = HTTParty.get("https://www.dexter.com.ar/marcas/nike/nike-icon-clash?mi=hm_f1_laniconclash_200926&psn=Full_1")
#    @parse_page ||= Nokogiri::HTML(doc)
#    end

#    names = parse_page.css("link")
   
# end
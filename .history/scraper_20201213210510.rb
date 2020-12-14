require 'HTTParty'
require 'Nokogiri'
require 'byebug'


def scraper
   url = "https://coinmarketcap.com/" # URL we want to target
   unparsed_page = HTTParty.get(url) # get request to that URL whick gives back the raw HTML
   parsed_page = Nokogiri::HTML(unparsed_page)# nokogiri parses that HTML into a format from where we can extract data out of
   top_10 = parsed_page.css('tbody tr:not([class])')
   top_10.each do |top_currency|
      top_currency = 0
      name_str = parsed_page.css('tbody tr td div.price___3rj7O a')[top_currency].attributes["href"].value
      name_str_split = name_str.delete "/currencies/"
      currency = {
         price: prices = parsed_page.css('tbody tr td div.price___3rj7O a.cmc-link')[top_currency].text,
         name: name_str_split[top_currency]
      }
      byebug
   end
end

scraper


# prices = parsed_page.css('tbody tr a @href') (value= currencies/name of currency)

# prices = parsed_page.css('tbody tr td div.price___3rj7O a.cmc-link').text   # TOP 10 PRICES
# prices = parsed_page.css('tbody tr td div.price___3rj7O a @href').text   # TOP 10 names (need to remove redundant par for the string)
# prices = parsed_page.css('tbody tr').count # 101
# parsed_page.css('tbody tr td div.price___3rj7O a')[0].attributes["href"].value # /currencies/bitcoin/markets/

# instructions: if RuntimeError Exception: You want to finish 3 frames, but stack size is only 2 , then gem uninstall pry-byebug






# bitcoin_table = parsed_page.css('html.js-focus.visible>body>div#container>div.row>div-col-12>div#btcExchangesTable_wrapper.dataTables_wrapper.no-footer')


# class Scraper
   
#    attr_accessor :parse_page

#    def initialize
#    doc = HTTParty.get("https://www.dexter.com.ar/marcas/nike/nike-icon-clash?mi=hm_f1_laniconclash_200926&psn=Full_1")
#    @parse_page ||= Nokogiri::HTML(doc)
#    end

#    names = parse_page.css("link")
   
# end
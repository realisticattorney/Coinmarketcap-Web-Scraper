require 'HTTParty'
require 'Nokogiri'
require 'byebug'
require 'json'
require 'fileutils'
def scraper
   url = "https://coinmarketcap.com/" # URL we want to target
   unparsed_page = HTTParty.get(url) # get request to that URL whick gives back the raw HTML
   parsed_page = Nokogiri::HTML(unparsed_page)# nokogiri parses that HTML into a format from where we can extract data out of
   currencies = Array.new
   currencies_listing = parsed_page.css('tbody tr:not([class])')
   page = 1
   per_page = parsed_page.css('tbody tr:not([class])').count
   total_currencies = parsed_page.css('div.sc-16r8icm-0.sc-8ccaqg-0.eEiCJF  p.sc-1eb5slv-0.kDEzev').text.split(" ")[-1]
   last_page = (total_currencies.to_f / (per_page.to_f - 1)).round
   while page <= 3
      pagination_url = "https://coinmarketcap.com/#{page}/"
      # puts pagination_url
      # puts "Page: #{page}"
      # puts ""
      pagination_unparsed_page = HTTParty.get(pagination_url)
      pagination_parsed_page = Nokogiri::HTML(pagination_unparsed_page)
      pagination_currencies_listing = pagination_parsed_page.css('tbody tr:not([class])')
      
      pagination_currencies_listing.count.times do |currency_index|
      currency = {
         price: pagination_parsed_page.css('tbody tr td div.price___3rj7O a.cmc-link')[currency_index].text,
         name: pagination_parsed_page.css('tbody tr td div.price___3rj7O a')[currency_index].attributes["href"].value
      }
      currencies << currency
      # byebug
   end
   page += 1
end
puts currencies
byebug
end

scraper


# prices = parsed_page.css('tbody tr a @href') (value= currencies/name of currency)
# top_10 = parsed_page.css('tbody tr:not([class])') top 10

# prices = parsed_page.css('tbody tr td div.price___3rj7O a.cmc-link').text   # TOP 10 PRICES
# prices = parsed_page.css('tbody tr td div.price___3rj7O a @href').text   # TOP 10 names (need to remove redundant par for the string)
# prices = parsed_page.css('tbody tr').count # 101
# parsed_page.css('tbody tr td div.price___3rj7O a')[0].attributes["href"].value # /currencies/bitcoin/markets/

# instructions: if RuntimeError Exception: You want to finish 3 frames, but stack size is only 2 , then gem uninstall pry-byebug


# parsed_page.css('tbody tr td div.price___3rj7O a')[top_currency].attributes["href"].value  .split("/")[1].upcase  #name of currency
# /[A-Z\,]+/.match(parsed_page.css('div.job-count').text)[0].gsub(",","") 




# bitcoin_table = parsed_page.css('html.js-focus.visible>body>div#container>div.row>div-col-12>div#btcExchangesTable_wrapper.dataTables_wrapper.no-footer')


# class Scraper
   
#    attr_accessor :parse_page

#    def initialize
#    doc = HTTParty.get("https://www.dexter.com.ar/marcas/nike/nike-icon-clash?mi=hm_f1_laniconclash_200926&psn=Full_1")
#    @parse_page ||= Nokogiri::HTML(doc)
#    end

#    names = parse_page.css("link")
   
# end



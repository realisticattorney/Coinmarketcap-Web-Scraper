require './main.rb'
require './constants.rb'

class MenuSelection
   attr_accessor :data_type
   def initialize;end

   def data_type_options(sel_menu_option)
   case sel_menu_option
   when 1
      @data_type = ASSET_TYPE.keys[sel_menu_option - 1]
   when 2
      @data_type = ASSET_TYPE.keys[sel_menu_option - 1]
   when 3
      @data_type = ASSET_TYPE.keys[sel_menu_option - 1]
   when 4
      @data_type = ASSET_TYPE.keys[sel_menu_option - 1]

   end
   call_asset_type
end

def call_asset_type
   url = ASSET_TYPE[@data_type]
   AssetScraper.new(url, @data_type.to_s)
end
end


class Parser
   private
 
   def parse
     Nokogiri::HTML(URI.open(@url))
   end
end


class AssetScraper < Parser
   def initialize(url, data_type)
      @url = url
      @data_type = data_type
      parser
   end
   
# def scraper
#    currencies = Array.new
#    currencies_listing = @parsed_page.css('tbody tr:not([class])')
#    page = 1
#    per_page = @parsed_page.css('tbody tr:not([class])').count
#    total_currencies = parsed_page.css('div.sc-16r8icm-0.sc-8ccaqg-0.eEiCJF  p.sc-1eb5slv-0.kDEzev').text.split(" ")[-1]
#    last_page = (total_currencies.to_f / (per_page.to_f - 1)).round
#    while page <= 3
#       pagination_url = "https://coinmarketcap.com/#{page}/"
#       # puts pagination_url
#       # puts "Page: #{page}"
#       # puts ""
#       pagination_unparsed_page = HTTParty.get(pagination_url)
#       pagination_parsed_page = Nokogiri::HTML(pagination_unparsed_page)
#       pagination_currencies_listing = pagination_parsed_page.css('tbody tr:not([class])')
      
#       pagination_currencies_listing.count.times do |currency_index|
#       currency = {
#          price: pagination_parsed_page.css('tbody tr td div.price___3rj7O a.cmc-link')[currency_index].text,
#          name: pagination_parsed_page.css('tbody tr td div.price___3rj7O a')[currency_index].attributes["href"].value
#       }
#       currencies << currency
#    end
#    page += 1
# end
# puts currencies
# end
require_relative './constants.rb'
require_relative './parser.rb'
require 'HTTParty'

class AssetScraper < Parser
   def initialize(url, data_type)
      @url = url
      @data_type = data_type
      scraper
   end
   unparsed_page = HTTParty.get(url) # get request to that URL whick gives back the raw HTML
   parsed_page = Nokogiri::HTML(unparsed_page)# nokogiri parses that HTML into a format from where we can extract data out of
def scraper
   currencies = Array.new
   @unparsed_page = HTTParty.get(@url)
   parsed_page = Nokogiri::HTML(unparsed_page)
   currencies_listing = @parsed_page.css('tbody tr:not([class])')
   page = 1
   per_page = @parsed_page.css('tbody tr:not([class])').count
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
   end
   page += 1
end
puts currencies
end
end
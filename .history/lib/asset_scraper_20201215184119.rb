require_relative './constants.rb'
require_relative './parser.rb'
require 'HTTParty'

class AssetScraper < Parser
   def initialize(url, data_type)
      @url = url
      @data_type = data_type
      puts @url
      puts @url
      puts @url
      puts @url
      puts @url
      puts @url
      puts @url
      scraper
   end
   
def scraper
   currencies = Array.new
   unparsed_page = HTTParty.get(@url)
   parsed_page = Nokogiri::HTML(unparsed_page)
   currencies_listing = parsed_page.css('tbody tr:not([class])')
   page = 1
   per_page = parsed_page.css('tbody tr:not([class])').count
   total_currencies = parsed_page.css('div.sc-16r8icm-0.sc-8ccaqg-0.eEiCJF  p.sc-1eb5slv-0.kDEzev').text.split(" ")[-1]
   last_page = (total_currencies.to_f / (per_page.to_f)).round
   puts total_currencies
   puts per_page
   puts last_page
   puts last_page
   while page <= last_page
      pagination_url = "#{@url}#{page.to_i}"
      puts pagination_url
      puts "Page: #{page}"
      puts @url

      pagination_unparsed_page = HTTParty.get(@url)
      pagination_parsed_page = Nokogiri::HTML(pagination_unparsed_page)
      pagination_currencies_listing = pagination_parsed_page.css('tbody tr:not([class])')
      
      pagination_currencies_listing.count.times do |currency_index|
      case @data_type.to_s
      when 'Crypto'
      currency = {
         price: pagination_parsed_page.css('tbody tr td div.price___3rj7O a.cmc-link')[currency_index].text,
         name: pagination_parsed_page.css('tbody tr td div.price___3rj7O a')[currency_index].attributes["href"].value
      }
      when 'Derivatives'
      currency = {
         price: pagination_parsed_page.css('tbody tr td div.price___3rj7O')[currency_index].text,
         name: pagination_parsed_page.css('tbody tr td div.price___3rj7O div')[currency_index].text
      }
      puts currency
      when 'DeFi'
      currency = {
         price: pagination_parsed_page.css('tbody tr td div.price___3rj7O a.cmc-link')[currency_index].text
         # name: pagination_parsed_page.css('tbody tr td div.price___3rj7O a')[currency_index].attributes["href"].value
      }
      when 'Yield_Farming'
      currency = {
         price: pagination_parsed_page.css('tbody tr td div.price___3rj7O a.cmc-link')[currency_index].text,
         name: pagination_parsed_page.css('tbody tr td div.price___3rj7O a')[currency_index].attributes["href"].value
      }
   else
      return false
   end
      currencies << currency
   end
   page += 1
end
puts currencies
end
end


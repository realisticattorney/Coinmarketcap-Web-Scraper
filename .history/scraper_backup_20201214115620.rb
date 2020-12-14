require 'HTTParty'
require 'Nokogiri'
require 'byebug'


def scraper
   url = "https://coinmarketcap.com/" # URL we want to target
   unparsed_page = HTTParty.get(url) # get request to that URL whick gives back the raw HTML
   parsed_page = Nokogiri::HTML(unparsed_page)# nokogiri parses that HTML into a format from where we can extract data out of
   top_10 = parsed_page.css('tbody tr:not([class])')
   page = 1
   per_page = parsed_page.css('tbody tr').count
   total_currencies = parsed_page.css('div.sc-16r8icm-0.sc-8ccaqg-0.eEiCJF  p.sc-1eb5slv-0.kDEzev').text.split(" ")[-1]
   last_page = (total_currencies.to_f / (per_page.to_f - 1)).round
   currencies = []
   i = 0
   top_10.each do |top_currency|
      top_currency = i
      currency = {
         price: prices = parsed_page.css('tbody tr td div.price___3rj7O a.cmc-link')[top_currency].text,
         name: parsed_page.css('tbody tr td div.price___3rj7O a')[top_currency].attributes["href"].value
      }
      i += 1
      currencies << currency
   end
   byebug
   end
   
   scraper
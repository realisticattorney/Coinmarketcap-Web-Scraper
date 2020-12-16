require_relative './constants'
require 'httparty'
require 'nokogiri'

# rubocop:disable all

class AssetScraper
  def initialize(url, data_type)
    @url = url
    @data_type = data_type
    scraper
  end

  def scraper
   unparsed_page = HTTParty.get(@url)
   parsed_page = Nokogiri::HTML(unparsed_page)
   currencies_listing = parsed_page.css('tbody tr:not([class])')
   per_page = parsed_page.css('tbody tr:not([class])').count
   total_currencies = parsed_page.css('div.sc-16r8icm-0.sc-8ccaqg-0.eEiCJF  p.sc-1eb5slv-0.kDEzev').text.split(' ')[-1]
   @last_page = (total_currencies.to_f / per_page.to_f).round
   puts "Total currencies: #{total_currencies}. urrencies that  will be displayed #{per_page}.\n\nPlease wait a moment..."
   scraper_iterator
end

def scraper_iterator
    currencies = []
      page = 1
    @last_page = 1 if @last_page.zero?
    while page <= @last_page && page <= 1
      pagination_url = "#{@url}#{page.to_i}/"
      puts "Page: #{page}"
      puts pagination_url
      pagination_unparsed_page = HTTParty.get(@url)
      pagination_unparsed_page = HTTParty.get(pagination_url) if @data_type == 'Crypto'
      pagination_parsed_page = Nokogiri::HTML(pagination_unparsed_page)
      pagination_currencies_listing = pagination_parsed_page.css('tbody tr:not([class])')

      pagination_currencies_listing.count.times do |currency_index|
        case @data_type.to_s
        when 'Crypto'
            price = pagination_parsed_page.css('tbody tr td div.price___3rj7O a.cmc-link')[currency_index].text
            name = pagination_parsed_page.css('tbody tr td div.price___3rj7O a')[currency_index].attributes['href'].value
            name = name.split('/')[-2].upcase
            currency = [name.to_s, price.to_s]

        when 'DeFi'
         price = pagination_parsed_page.css('tbody tr td div.price___3rj7O a.cmc-link')[currency_index].text
         name = pagination_parsed_page.css('tbody tr td div.price___3rj7O a')[currency_index].attributes['href'].value
         name = name.split('/')[-2].upcase
         currency = [name.to_s, price.to_s]
        else
          return false
        end
        currencies << currency
      end
      page += 1
    end
    currencies.each{|name, price| puts "\n#{name} : #{price} \n" }
  end
end
# rubocop:enable all
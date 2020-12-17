# rubocop: disable Layout/LineLength, Metrics/MethodLength
require_relative './constants'
require 'httparty'
require 'nokogiri'

class AssetScraper
  def initialize(url, data_type)
    @url = url
    @data_type = data_type
    scraper
  end

  private

  def scraper
    unparsed_page = HTTParty.get(@url)
    parsed_page = Nokogiri::HTML(unparsed_page.body)
    currencies_listing = parsed_page.css('tbody tr:not([class])')
    per_page = parsed_page.css('tbody tr:not([class])').count
    total_currencies = parsed_page.css('div.sc-16r8icm-0.sc-8ccaqg-0.eEiCJF  p.sc-1eb5slv-0.kDEzev').text.split(' ')[-1]
    last_page = (total_currencies.to_f / per_page).round
    puts "\nTotal currencies: #{total_currencies}.\n\nTotal pages: #{last_page}. For this demo the amount of currencies that  will be displayed is #{per_page}.\n\nPlease wait a moment while we process the current prices..."
    scraper_iterator
  end

  def scraper_iterator
    page = 1
    pagination_url = "#{@url}#{page.to_i}/"
    pagination_unparsed_page = HTTParty.get(pagination_url)
    pagination_parsed_page = Nokogiri::HTML(pagination_unparsed_page.body)
    pagination_currencies_listing = pagination_parsed_page.css('tbody tr:not([class])')
    iterator(pagination_parsed_page, pagination_currencies_listing)
  end

  def iterator(pagination_parsed_page, pagination_currencies_listing)
    currencies = []
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
    currencies.each { |name, price| puts "\n#{name} : #{price} \n" }
  end
end
# rubocop: enable Layout/LineLength, Metrics/MethodLength

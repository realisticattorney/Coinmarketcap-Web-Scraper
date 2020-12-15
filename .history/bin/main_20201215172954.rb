#!/usr/bin/env ruby

require 'HTTParty'
require 'Nokogiri'
require_relative '../lib/menu_selection.rb'
require_relative '../lib/constants.rb'

class Main
   def initialize
      @menu = MenuSelection.new
      welcome_message_board
   end

   private

   def welcome_message_board
      puts "\n\nWelcome to cryptocurriencies analytic tools\n\n"
      options_menu
      end

   def options_menu
      puts "\nPlase select one type of options:"
      puts "\n\nPress 1 : Crypto"
      puts "\nPress 2 : Derivatives"
      puts "\nPress 3 : DeFi"
      puts "\nPress 4 : Yield Farming"
      option = option_validation((1..4), gets.chomp.to_i)
      # option = option.to_i - 1
      @asset_chosen = ASSET_TYPE.keys[option - 1]
      @menu.data_type = @asset_chosen
      @menu.data_type_options(option)
   end

   def option_validation(range, input)
         while !range.any?(input)
            puts "please enter a valid number between 1 & 4" 
            break if range.any? (input = gets.chomp.to_i)
         end
         input
   end
# def parser
#    url = "https://coinmarketcap.com/" # URL we want to target
#    @unparsed_page = HTTParty.get(url) # get request to that URL whick gives back the raw HTML
#    @parsed_page = Nokogiri::HTML(unparsed_page)# nokogiri parses that HTML into a format from where we can extract data out of
#    scraper(unparsed_page, parse_page)
# end

end

Main.new


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



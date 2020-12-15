#!/usr/bin/env ruby

require 'HTTParty'
require 'Nokogiri'
require_relative '../lib/menu_selection'
require_relative '../lib/constants'

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
    option = option_validation((1..3), gets.chomp.to_i)
    # option = option.to_i - 1
    @asset_chosen = ASSET_TYPE.keys[option - 1]
    @menu.data_type = @asset_chosen
    @menu.data_type_options(option)
  end

  def option_validation(range, input)
    while range.none?(input)
      puts 'please enter a valid number between 1 & 4'
      break if range.any?(input = gets.chomp.to_i)
    end
    input
  end
end

Main.new

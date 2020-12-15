require './main.rb'
require './constants.rb'

class MenuSelection
   attr_accessor :data_type
   def initialize;end

   def data_type_options(sel_menu_option)
   case sel_menu_option
   when 1
      @data_type = ASSET_TYPE.keys[sel_menu_option - 1]
   when 1
      @data_type = ASSET_TYPE.keys[sel_menu_option - 1]
   when 1
      @data_type = ASSET_TYPE.keys[sel_menu_option - 1]




      
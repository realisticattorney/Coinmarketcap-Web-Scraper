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




      
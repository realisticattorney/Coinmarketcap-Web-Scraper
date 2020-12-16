require_relative './constants'
require_relative './asset_scraper'

class MenuSelection
  attr_accessor :data_type


  def data_type_options(sel_menu_option)
    case sel_menu_option
    when 1
      @data_type = ASSET_TYPE.keys[sel_menu_option - 1]
    when 2
      @data_type = ASSET_TYPE.keys[sel_menu_option - 1]
    else
      return false
    end
    call_asset_type
  end
  
  private

  def call_asset_type
    url = ASSET_TYPE[@data_type]
    AssetScraper.new(url, @data_type.to_s)
  end
end

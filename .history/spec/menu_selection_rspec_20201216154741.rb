require_relative '../lib/menu_selecion'
require_relative './constants'
require_relative './asset_scraper'

describe MenuSelection do

   let:data_type) {1}
   let(:menu) {MenuSelection.new.data_type_options(data_type)}
   context "initialize" do
      it "creates an instance" do
         expect(menu).to eql(true)
      it "" do
   expect(ASSET_TYPE.keys.any?).to eql(true)
      end
   end

end

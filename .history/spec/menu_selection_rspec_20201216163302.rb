require_relative '../lib/menu_selection.rb'

describe MenuSelection do
   let(:menu) {MenuSelection.new}
   let(:ri)
      it "raises error when an argument is given" do
         expect{menu('argument')}.to raise_error(ArgumentError)
      end
      it "raises error when the method is called without any argument" do
      expect{menu.data_type_options}.to raise_error(ArgumentError)
      end
      it "checks that if the input given is among the available options 1 or 2" do
      expect(menu.data_type_options(3)).to eql(false)
      end
      it "checks that if the input given is among the available options 1 or 2" do
      expect(menu.data_type_options(1)).to eql?(@data_type("Crypto"))
      end
end

require_relative '../lib/menu_selection.rb'

describe MenuSelection do
   let(:menu) {MenuSelection.new}
      it "raises error when an argument is given" do
         expect{menu('argument')}.to raise_error(ArgumentError)
      end
      it "checks that a option selected is valid" do
      expect{}
end

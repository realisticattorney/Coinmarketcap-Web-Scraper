require_relative '../lib/menu_selection.rb'

describe MenuSelection do
   let(:menu) {MenuSelection.new}
      it "raises error when an argument is given" do
         expect{menu('argument')}.to raise_error(ArgumentError)
      end
      it "raises error when the method is called without any argument" do
      expect{menu.data_type_options}.to raise_error(ArgumentError)
      end
      it "checks that an argument is valid" do
      expect{menu.data_type_options{1)}.to eql(Integer)
      end
end

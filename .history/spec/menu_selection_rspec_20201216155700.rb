require_relative '../lib/menu_selection.rb'

describe MenuSelection do
   let(:menu) {MenuSelection.new}
      it "creates an instance" do
         expect(MenuSelection.new).to raise_error(ArgumentError)
      end
end

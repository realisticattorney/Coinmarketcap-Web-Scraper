require_relative '../lib/menu_selection.rb'

describe MenuSelection do
   let(:menu) {MenuSelection.new}
      it "creates an instance" do
         expect(menu).to eql()
      end
end

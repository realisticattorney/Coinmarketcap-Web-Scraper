require_relative '../lib/menu_selection.rb'

describe MenuSelection do
      it "creates an instance" do
         menu = MenuSelection.new(11)
         expect(menu).to raise_error(ArgumentError)
      end

end

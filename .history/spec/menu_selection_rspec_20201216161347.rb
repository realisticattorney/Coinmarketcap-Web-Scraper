require_relative '../lib/menu_selection.rb'

describe MenuSelection do
      it "creates an instance" do
         menu = MenuSelection.new('dada')
         expect(menu).to raise_error(ArgumentError)
      end

end

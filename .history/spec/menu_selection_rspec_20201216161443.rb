require_relative '../lib/menu_selection.rb'

describe MenuSelection do
      it "creates an instance" do
         menu = MenuSelection.new('dada')
         expect(MenuSelection.new).to raise_error(ArgumentError)
      end

end

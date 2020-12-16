require '\menu_selection.rb'

describe MenuSelection do
   let(:menu) {MenuSelection.new}
      it "creates an instance" do
         expect(MenuSelection.new{'value'}).to raise_error(true)
      end
end

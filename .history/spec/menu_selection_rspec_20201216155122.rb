require '../lib/menu_selecion'

describe MenuSelection do
   let(:menu) {MenuSelection.new}
   let(:data_type) {1}
      it "creates an instance" do
         expect(MenuSelection.new('value')).to raise_error(ArgumentError)
      end

end

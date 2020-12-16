require '../lib/menu_selecion'

describe MenuSelection do
   let(:menu) {MenuSelection.new}
   let(:data_type) {1}
      it "creates an instance" do
         expect(MenuSelection.new('value')).to raise_error(ArgumentError)
      end
   context "aa" do
      it "" do
   expect(ASSET_TYPE.keys.any?(data_type)).to eql(true)
      end
   end
end

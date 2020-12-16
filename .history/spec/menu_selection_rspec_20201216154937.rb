require '../lib/menu_selecion'

describe MenuSelection do
   let(:menu) {MenuSelection.new}
   let(:data_type) {1}
   context "initialize" do
      it "creates an instance" do
         expect(MenuSelection.new).to raise_error(ArgumentError)
      end
   end
   context "aa" do
      it "" do
   expect(ASSET_TYPE.keys.any?(data_type)).to eql(true)
      end
   end
end

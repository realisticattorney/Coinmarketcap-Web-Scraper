require_relative '../lib/menu_selection.rb'

describe MenuSelection do
   let(:menu) {MenuSelection.new}
   let{:data_type} {menu.data_type_options(1)}
      it "creates an instance" do
         expect(menu).to eql()
      end
      it "checks" do
         expect(data_type)
end

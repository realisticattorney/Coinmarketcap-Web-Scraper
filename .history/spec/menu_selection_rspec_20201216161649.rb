require_relative '../lib/menu_selection.rb'

describe MenuSelection do
   let(:menu) {m}
      it "creates an instance" do
         expect{MenuSelection.new('dadaa')}.to raise_error(ArgumentError)
      end

end

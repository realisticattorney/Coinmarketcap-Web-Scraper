require_relative '../lib/menu_selection.rb'

describe MenuSelection do
   let(:menu) {MenuSelection.new}
      it "raises error when  do
         expect{menu('argument')}.to raise_error(ArgumentError)
      end

end

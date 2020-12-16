require_relative '../lib/ma.rb'

describe MenuSelection do
   let(:menu) {MenuSelection.new}
      it "creates an instance" do
         expect(MenuSelection.new{'value'}).to raise_error(ArgumentError)
      end
end

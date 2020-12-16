require_relative '../lib/menu_selecion'

describe MenuSelection do
   (let:menu) {MenuSelection.new}
   (let:data_type) {1}
   context "initialize" do
      it "creates an instance" do
         expect(menu).to 
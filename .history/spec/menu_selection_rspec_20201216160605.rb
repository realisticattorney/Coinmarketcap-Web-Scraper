require_relative '../lib/menu_selection.rb'

describe MenuSelection do
   let(:menu) {MenuSelection.new}
   let{:data_type} {menu.data_type_options(1)}


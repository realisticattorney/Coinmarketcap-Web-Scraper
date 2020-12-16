require_relative '../lib/menu_selection.rb'

describe MenuSelection do
   it 'Raises argument error when less than two arguments are given' do
      expect { MenuSelection.new('value') }.to raise_error(ArgumentError)
    end
   end
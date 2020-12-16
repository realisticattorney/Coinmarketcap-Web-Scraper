require_relative '../lib/asset_scraper.rb'


describe AssetScraper do
   let(:starter) {AssetScraper.new}
   context 'intialize' do
      it 'raises error if less than 2 arguments are given' do
         expect{starter}.to raise_error(ArgumentError)
      end
   end
   it 'raises error if less than 2 arguments are given' do
      expect{starter.iterator}.to raise_error(ArgumentError)
end
end

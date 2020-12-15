require 'nokogiri'
require 'open-uri'
require 'HTTParty'


class Parser
   private
 
   def parse
     Nokogiri::HTML(URI.open(@url))
   end
end
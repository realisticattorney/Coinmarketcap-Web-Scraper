require 'nokogiri'
require 'open-uri'


class Parser
   private
 
   def parse
     Nokogiri::HTML(URI.open(@url))
   end
end
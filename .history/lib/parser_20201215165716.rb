require 'nokogiri'
require 'open-uri'
require 'HTTParty'
require 'b'

class Parser
   private
 
   def parse
     Nokogiri::HTML(URI.open(@url))
   end
end
require 'nokogiri'
require 'open-uri'
require 'HTTParty'
require ''

class Parser
   private
 
   def parse
     Nokogiri::HTML(URI.open(@url))
   end
end
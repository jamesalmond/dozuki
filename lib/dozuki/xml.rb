require 'dozuki/xml/node'
module Dozuki
  module XML
    def self.parse(string)
      Node.new(Nokogiri::XML.parse(string))
    end
  end
end
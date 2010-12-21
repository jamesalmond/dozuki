require 'dozuki/xml/node'
require 'dozuki/xml/node_collection'
require 'dozuki/xml/parser'
require 'dozuki/xml/exceptions'

module Dozuki
  module XML
    def self.parse(string)
      Node.new(Nokogiri::XML.parse(string))
    end
  end
end
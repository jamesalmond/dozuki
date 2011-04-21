require 'dozuki/xml/node'
require 'dozuki/xml/node_collection'

module Dozuki
  module XML
    def self.parse(*args)
      Node.new(Nokogiri::XML.parse(*args))
    end
  end
end

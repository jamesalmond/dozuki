require 'nokogiri'

require 'dozuki/exceptions'
require 'dozuki/parsers'
require 'dozuki/node'
require 'dozuki/node_collection'

require 'dozuki/xml'
require 'dozuki/html'

module Dozuki
  def self.HTML(*args)
    HTML.parse(*args)
  end
end

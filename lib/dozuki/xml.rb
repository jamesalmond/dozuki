module Dozuki
  module XML
    def self.parse(*args)
      Node.new(Nokogiri::XML.parse(*args))
    end
  end
end

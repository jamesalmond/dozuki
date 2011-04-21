module Dozuki
  module HTML
    def self.parse(*args)
      Node.new(Nokogiri::HTML.parse(*args))
    end
  end
end

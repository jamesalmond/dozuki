module Dozuki
  module Parsers
    module String
      def self.parse(node)
        node.text.strip
      end
    end
    module Integer
      def self.parse(node)
        string = String.parse(node)
        begin
          Integer(string)
        rescue ArgumentError
          raise InvalidFormat.new(:node => node, :value => string, :format => "integer")
        end
      end
    end
    module Float
      def self.parse(node)
        string = String.parse(node)
        begin
          Float(string)
        rescue ArgumentError
          raise InvalidFormat.new(:node => node, :value => string, :format => "float")
        end
      end
    end
  end
end

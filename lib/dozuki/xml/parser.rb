module Dozuki
  module XML
    module Parser

      def self.to_string(node)
        node.text.strip
      end

      def self.to_int(node)
        string = to_string(node)
        begin
          Integer(to_string(node))
        rescue ArgumentError
          raise InvalidFormat.new(:node => node, :value => string, :format => "integer")
        end
      end

      def self.to_float(node)
        string = to_string(node)
        begin
          Float(string)
        rescue ArgumentError
          raise InvalidFormat.new(:node => node, :value => string, :format => "float")
        end
      end

    end
  end
end

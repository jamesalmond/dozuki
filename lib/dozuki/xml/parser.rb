module Dozuki
  module XML
    module Parser

      def self.to_string(node)
        node.text.strip
      end

      def self.to_int(node)
        string = to_string(node)
        raise InvalidFormat.new("Parsing error", :node => node, :value => string, :format => "int") unless string =~ /^-?[0-9]+$/
        string.to_i
      end

      def self.to_float(node)
        string = to_string(node)
        raise InvalidFormat.new("Parsing error", :node => node, :value => string, :format => "float") unless string =~ /^-?[0-9]+(\.[0-9]+)?$/
        string.to_f
      end

    end
  end
end

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
    module Date
      def self.parse(node)
        string = String.parse(node)
        begin
          ::Date.parse(string)
        rescue ArgumentError
          raise InvalidFormat.new(:node => node, :value => string, :format => "date")
        end
      end
    end
    module Boolean
      def self.parse(node)
        true_values.include? String.parse(node)
      end
      def self.true_values
        ['1', 'true']
      end
    end
  end
end

module Dozuki
  module XML
    class NotFound < StandardError
      attr_accessor :xpath, :node
      
      def initialize(msg=nil, opts={})
        super msg
        self.xpath = opts[:xpath]
        self.node = opts[:node]
      end
    end
    class InvalidFormat < StandardError
      attr_accessor :format, :node, :value
      
      def initialize(msg=nil, opts={})
        super msg
        self.format = opts[:format]
        self.node = opts[:node]
        self.value = opts[:value]
      end
    end
  end
end
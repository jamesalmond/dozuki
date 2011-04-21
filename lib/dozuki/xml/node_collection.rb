module Dozuki
  module XML
    class NodeCollection
      attr_accessor :collection

      def initialize(collection)
        self.collection = collection
      end

      def as_node(&blk)
        collection.each{|item| blk.call(Node.new(item))}
      end

      def as_string(&blk)
        collection.each{|item| blk.call(Parser.to_string(item))}
      end

      def as_int(&blk)
        collection.each{|item| blk.call(Parser.to_int(item))}
      end

      def as_float(&blk)
        collection.each{|item| blk.call(Parser.to_float(item))}
      end
    end
  end
end

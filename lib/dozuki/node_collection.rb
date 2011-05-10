module Dozuki
  class NodeCollection
    attr_accessor :collection

    def initialize(collection)
      self.collection = collection
    end

    def as_node(&blk)
      collection.each{|item| blk.call(Node.new(item))}
    end

    def as_string(&blk)
      each_as(Parsers::String, &blk)
    end

    def as_int(&blk)
      each_as(Parsers::Integer, &blk)
    end

    def as_float(&blk)
      each_as(Parsers::Float, &blk)
    end

    def as_date(&blk)
      each_as(Parsers::Date, &blk)
    end

    def as_boolean(&blk)
      each_as(Parsers::Boolean, &blk)
    end

    private
      def each_as(parser, &blk)
        collection.each{|item| blk.call(parser.parse(item))}
      end
  end
end

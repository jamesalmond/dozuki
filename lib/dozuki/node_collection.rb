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
      collection.each{|item| blk.call(Parsers::String.parse(item))}
    end

    def as_int(&blk)
      collection.each{|item| blk.call(Parsers::Integer.parse(item))}
    end

    def as_float(&blk)
      collection.each{|item| blk.call(Parsers::Float.parse(item))}
    end
    def as_date(&blk)
      collection.each{|item| blk.call(Parsers::Date.parse(item))}
    end
  end
end

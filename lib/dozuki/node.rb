require 'dozuki/parsers'
module Dozuki
  class Node
    attr_accessor :nokogiri_node

    def initialize(nokogiri_node)
      self.nokogiri_node = nokogiri_node
    end

    def method_missing(method, *args, &blk)
      nokogiri_node.send(method, *args, &blk)
    end

    def respond_to?(method)
      nokogiri_node.respond_to?(method) ? true : super
    end

    def each(xpath, &blk)
      collection = NodeCollection.new(nokogiri_node.xpath(xpath))
      block_given? ? collection.as_node(&blk) : collection
    end

    def string(xpath)
      Parsers::String.parse(get_first_node(xpath))
    end

    def int(xpath)
      Parsers::Integer.parse(get_first_node(xpath))
    end

    def float(xpath)
      Parsers::Float.parse(get_first_node(xpath))
    end

    def get(xpath)
      node = Node.new(get_first_node(xpath))
      yield node if block_given?
      node
    end

    def exists?(xpath)
      !nokogiri_node.xpath(xpath).empty?
    end

    private 
      def get_first_node(xpath)
        node = nokogiri_node.xpath(xpath)
        raise NotFound.new("Node not found", :xpath => xpath, :node => nokogiri_node) if node.empty?
        node.first
      end

  end
end

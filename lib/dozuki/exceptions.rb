module Dozuki
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

    def initialize(opts={})
      super "Cannot parse '#{opts[:value]}' to #{opts[:format]}"
      self.format = opts[:format]
      self.node = opts[:node]
      self.value = opts[:value]
    end
  end
end

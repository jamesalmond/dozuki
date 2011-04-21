require 'spec_helper'

module Dozuki
  describe Node do

    describe "initialization" do
      let(:nokogiri_node){mock("nokogiri_node")}
      subject{Node.new(nokogiri_node)}
      its(:nokogiri_node){should  == nokogiri_node}
    end

    describe "missing methods" do
      let(:nokogiri_node){mock("nokogiri node")}
      subject{Node.new(nokogiri_node)}
      it "should be proxied to the nokogiri node" do
        nokogiri_node.should_receive(:blah)
        subject.blah
      end
      it "should be proxied to the nokogiri node with args" do
        args  = [1,2,3]
        nokogiri_node.should_receive(:blah).with(*args)
        subject.blah(*args)
      end
      it "should be proxied to the nokogiri node with blocks" do
        blk = Proc.new{}
        nokogiri_node.should_receive(:blah).with(&blk)
        subject.blah(&blk)
      end
    end

    describe "responding to nokogiri's methods" do
      let(:nokogiri_node){mock("nokogiri node")}
      let(:node){Node.new(nokogiri_node)}
      subject{node.respond_to?(:something_silly)}
      context "where nokogiri responds to the method" do
        before(:each){nokogiri_node.stub(:respond_to?).with(:something_silly).and_return(true)}
        it "should return true" do
          subject.should be_true
        end
      end
      context "where nokogiri responds to the method" do
        before(:each){nokogiri_node.stub(:respond_to?).with(:something_silly).and_return(false)}
        it "should return true" do
          subject.should be_false
        end
      end
    end

    describe "each" do
      let(:nokogiri_node)   {mock("nokogiri_node")}
      let(:xpath)           {"/some/xpath"}
      let(:node)            {Node.new(nokogiri_node)}
      let(:blk)             {Proc.new {}}
      let(:collection)      {mock "node set"}
      let(:node_collection) {mock "node_collection"}
      before(:each) do
        nokogiri_node.stub(:xpath).and_return(collection)
        NodeCollection.stub(:new).and_return(node_collection)

      end
      subject{node.each(xpath)}

      it "should get the collection from the nokogiri node" do
        nokogiri_node.should_receive(:xpath).with(xpath)
        subject
      end

      it "should create a new NodeCollection with the collection" do
        NodeCollection.should_receive(:new).with(collection)
        subject
      end

      it "should return the collection" do
        subject.should == node_collection
      end

      context "where no block is passed" do
        before(:each) do
          node_collection.stub(:as_node).and_return(node_collection)
        end
        subject{ node.each(xpath, &blk)}
        it "should call to_node on the node_collection with the passed block" do
          node_collection.should_receive(:as_node).with(&blk)
          subject
        end
      end
    end

    describe "string" do
      let(:nokogiri_node)   { mock("nokogiri_node") }
      let(:xpath)           { "/some/xpath" }
      let(:node)            { Node.new(nokogiri_node) }
      let(:text_node)       { mock "some node" }
      let(:parsed)   { mock "parsed result" }

      before(:each) do
        nokogiri_node.stub(:xpath).and_return([text_node])
        Dozuki::Parsers::String.stub(:parse).and_return(parsed)
      end

      subject{ node.string(xpath) }

      it "should get the collection from the nokogiri node" do
        nokogiri_node.should_receive(:xpath).with(xpath)
        subject
      end
      it "should parse the node to a string" do
        Dozuki::Parsers::String.should_receive(:parse).with(text_node)
        subject
      end
      it "should return the parsed result" do
        subject.should == parsed
      end
      context "where the xpath returns no node" do
        before(:each) do
          nokogiri_node.should_receive(:xpath).and_return([])
        end
        it "should raise a NotFound error" do
          expect{subject}.to raise_error(Dozuki::NotFound)
        end
      end
    end

    describe "int" do
      let(:nokogiri_node)   { mock("nokogiri_node") }
      let(:xpath)           { "/some/xpath" }
      let(:node)            { Node.new(nokogiri_node) }
      let(:int_node)       { mock "some node" }
      let(:parsed)   { mock "parsed result" }

      before(:each) do
        nokogiri_node.stub(:xpath).and_return([int_node])
        Dozuki::Parsers::Integer.stub(:parse).and_return(parsed)
      end

      subject{ node.int(xpath) }

      it "should get the collection from the nokogiri node" do
        nokogiri_node.should_receive(:xpath).with(xpath)
        subject
      end
      it "should parse the node to an int" do
        Dozuki::Parsers::Integer.should_receive(:parse).with(int_node)
        subject
      end
      it "should return the parsed result" do
        subject.should == parsed
      end
      context "where the xpath returns no node" do
        before(:each) do
          nokogiri_node.should_receive(:xpath).and_return([])
        end
        it "should raise a NotFound error" do
          expect{subject}.to raise_error(Dozuki::NotFound)
        end
      end
    end

    describe "float" do
      let(:nokogiri_node)   { mock("nokogiri_node") }
      let(:xpath)           { "/some/xpath" }
      let(:node)            { Node.new(nokogiri_node) }
      let(:float_node)       { mock "some node" }
      let(:parsed)   { mock "parsed result" }

      before(:each) do
        nokogiri_node.stub(:xpath).and_return([float_node])
        Dozuki::Parsers::Float.stub(:parse).and_return(parsed)
      end

      subject{ node.float(xpath) }

      it "should get the collection from the nokogiri node" do
        nokogiri_node.should_receive(:xpath).with(xpath)
        subject
      end
      it "should parse the node to an int" do
        Dozuki::Parsers::Float.should_receive(:parse).with(float_node)
        subject
      end
      it "should return the parsed result" do
        subject.should == parsed
      end
      context "where the xpath returns no node" do
        before(:each) do
          nokogiri_node.should_receive(:xpath).and_return([])
        end
        it "should raise a NotFound error" do
          expect{subject}.to raise_error(Dozuki::NotFound)
        end
      end
    end

    describe "get" do
      let(:nokogiri_node)   { mock("nokogiri_node") }
      let(:xpath)           { "/some/xpath" }
      let(:node)            { Node.new(nokogiri_node) }
      let(:wanted_node)     { mock "some node" }

      before(:each) do
        nokogiri_node.stub(:xpath).and_return([wanted_node])
      end

      subject{ node.get(xpath) }

      it "should get the collection from the nokogiri node" do
        nokogiri_node.should_receive(:xpath).with(xpath)
        subject
      end
      it "should return the new dozuki node" do
        subject.nokogiri_node.should == wanted_node
      end

      context "where the xpath returns no node" do
        before(:each) do
          nokogiri_node.should_receive(:xpath).and_return([])
        end
        it "should raise a NotFound error" do
          expect{subject}.to raise_error(Dozuki::NotFound)
        end
      end
      context "where a block is passed" do
        subject{node.get(xpath, &blk)}
        it "should call the block with the node" do
          node.get(xpath) do |block_node|
            block_node.nokogiri_node.should == wanted_node
          end
        end
      end
    end

    describe "exists?" do
      let(:nokogiri_node)   { mock("nokogiri_node") }
      let(:xpath)           { "/some/xpath" }
      let(:node)            { Node.new(nokogiri_node) }
      let(:xpath_result)    {["something"]}
      before(:each) do
        nokogiri_node.stub(:xpath).and_return(xpath_result)
      end
      subject{ node.exists?(xpath) }
      it "should get the xpath from the nokogiri_node" do
        nokogiri_node.should_receive(:xpath).with(xpath)
        subject
      end
      it "should return true for a non-empty node" do
        subject.should be_true
      end
      context "where the results are not empty?" do
        let(:xpath_result){[]}
        it "should return false for an empty set" do
          subject.should be_false
        end
      end
    end

  end
end

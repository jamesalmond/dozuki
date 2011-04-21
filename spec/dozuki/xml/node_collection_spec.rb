require 'spec_helper'
module Dozuki
  module XML
    describe NodeCollection do

      describe "as_node" do
        let(:collection){mock "some_nodes"}
        let(:blk){Proc.new{}}
        let(:node_collection){NodeCollection.new(collection)}
        let(:collection_item){mock "collection item"}
        let(:new_node){mock "new node"}
        before(:each) do
          collection.stub(:each).and_yield(collection_item)
          Node.stub(:new).and_return(new_node)
        end

        subject{node_collection.as_node(&blk)}

        it "should iterate through the collection" do
          collection.should_receive(:each)
          subject
        end
        it "should create a new Node with the yielded collection item"  do
          Node.should_receive(:new).with(collection_item)
          subject
        end
        it "should call the bloc with the node" do
          blk.should_receive(:call).with(new_node)
          subject
        end
      end

      describe "as_string" do
        let(:collection){mock "some_nodes"}
        let(:blk){Proc.new{}}
        let(:node_collection){NodeCollection.new(collection)}
        let(:collection_item){mock "collection item"}
        let(:string){"string"}
        before(:each) do
          collection.stub(:each).and_yield(collection_item)
          Parser.stub(:to_string).and_return(string)
        end

        subject{node_collection.as_string(&blk)}

        it "should iterate through the collection" do
          collection.should_receive(:each)
          subject
        end
        it "should create a new Node with the yielded collection item"  do
          Parser.should_receive(:to_string).with(collection_item)
          subject
        end
        it "should call the bloc with the node" do
          blk.should_receive(:call).with("string")
          subject
        end
      end

      describe "as_int" do
        let(:collection){mock "some_nodes"}
        let(:blk){Proc.new{}}
        let(:node_collection){NodeCollection.new(collection)}
        let(:collection_item){mock "collection item"}
        let(:int){39}
        before(:each) do
          collection.stub(:each).and_yield(collection_item)
          Parser.stub(:to_int).and_return(int)
        end

        subject{node_collection.as_int(&blk)}

        it "should iterate through the collection" do
          collection.should_receive(:each)
          subject
        end
        it "should create a new Node with the yielded collection item"  do
          Parser.should_receive(:to_int).with(collection_item)
          subject
        end
        it "should call the bloc with the node" do
          blk.should_receive(:call).with(int)
          subject
        end
      end

      describe "as_float" do
        let(:collection){mock "some_nodes"}
        let(:blk){Proc.new{}}
        let(:node_collection){NodeCollection.new(collection)}
        let(:collection_item){mock "collection item"}
        let(:float){39.50}
        before(:each) do
          collection.stub(:each).and_yield(collection_item)
          Parser.stub(:to_float).and_return(float)
        end

        subject{node_collection.as_float(&blk)}

        it "should iterate through the collection" do
          collection.should_receive(:each)
          subject
        end
        it "should create a new Node with the yielded collection item"  do
          Parser.should_receive(:to_float).with(collection_item)
          subject
        end
        it "should call the bloc with the node" do
          blk.should_receive(:call).with(float)
          subject
        end
      end

    end
  end
end

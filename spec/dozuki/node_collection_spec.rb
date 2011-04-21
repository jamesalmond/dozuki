require 'spec_helper'
module Dozuki
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
        Dozuki::Parsers::String.stub(:parse).and_return(string)
      end

      subject{node_collection.as_string(&blk)}

      it "should iterate through the collection" do
        collection.should_receive(:each)
        subject
      end
      it "should create a new Node with the yielded collection item"  do
        Dozuki::Parsers::String.should_receive(:parse).with(collection_item)
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
        Dozuki::Parsers::Integer.stub(:parse).and_return(int)
      end

      subject{node_collection.as_int(&blk)}

      it "should iterate through the collection" do
        collection.should_receive(:each)
        subject
      end
      it "should create a new Node with the yielded collection item"  do
        Dozuki::Parsers::Integer.should_receive(:parse).with(collection_item)
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
        Dozuki::Parsers::Float.stub(:parse).and_return(float)
      end

      subject{node_collection.as_float(&blk)}

      it "should iterate through the collection" do
        collection.should_receive(:each)
        subject
      end
      it "should create a new Node with the yielded collection item"  do
        Dozuki::Parsers::Float.should_receive(:parse).with(collection_item)
        subject
      end
      it "should call the bloc with the node" do
        blk.should_receive(:call).with(float)
        subject
      end
    end

  end
end
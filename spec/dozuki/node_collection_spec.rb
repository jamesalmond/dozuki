require 'spec_helper'
module Dozuki
  describe NodeCollection do

    let(:collection_item){mock "collection item"}
    let(:collection){ [collection_item] }
    let(:node_collection){NodeCollection.new(collection)}


    describe "as_node" do
      let(:a_dozuki_node){mock "a dozuki node"}

      before(:each) do
        Node.stub(:new).and_return(a_dozuki_node)
      end

      subject{ node_collection.as_node{|arg| @block_called_with = arg} }

      it "should create a new Node with the yielded collection item"  do
        Node.should_receive(:new).with(collection_item).and_return(a_dozuki_node)
        subject
      end
      it "should call the block with the wrapped dozuki node" do
        subject
        @block_called_with.should == a_dozuki_node
      end
    end

    describe "as_string" do

      let(:a_string){"string"}

      before(:each) do
        Dozuki::Parsers::String.stub(:parse).and_return(a_string)
      end

      subject{ node_collection.as_string{|arg| @block_called_with = arg} }

      it "should create a new Node with the yielded collection item"  do
        Dozuki::Parsers::String.should_receive(:parse).with(collection_item).and_return(a_string)
        subject
      end
      it "should call the bloc with the string" do
        subject
        @block_called_with.should == a_string
      end
    end

    describe "as_int" do

      let(:an_int){39}

      before(:each) do
        Dozuki::Parsers::Integer.stub(:parse).and_return(an_int)
      end

      subject{ node_collection.as_int{|arg| @block_called_with = arg} }

      it "should create a new Node with the yielded collection item"  do
        Dozuki::Parsers::Integer.should_receive(:parse).with(collection_item).and_return(an_int)
        subject
      end
      it "should call the bloc with the integer" do
        subject
        @block_called_with.should == an_int
      end
    end

    describe "as_float" do

      let(:a_float){39.50}

      before(:each) do
        Dozuki::Parsers::Float.stub(:parse).and_return(a_float)
      end

      subject{node_collection.as_float{|arg| @block_called_with = arg}}

      it "should create a new Node with the yielded collection item"  do
        Dozuki::Parsers::Float.should_receive(:parse).with(collection_item).and_return(a_float)
        subject
      end
      it "should call the bloc with the node" do
        subject
        @block_called_with.should == a_float
      end
    end
    
    describe "as_date" do

      let(:a_date){Date.civil(2012, 2,5)}

      before(:each) do
        Dozuki::Parsers::Date.stub(:parse).and_return(a_date)
      end

      subject{node_collection.as_date{|arg| @block_called_with = arg}}

      it "should create a new Node with the yielded collection item"  do
        Dozuki::Parsers::Date.should_receive(:parse).with(collection_item).and_return(a_date)
        subject
      end
      it "should call the bloc with the node" do
        subject
        @block_called_with.should == a_date
      end
    end

  end
end

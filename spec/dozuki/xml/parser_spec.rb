require 'spec_helper'

module Dozuki
  module XML
    describe Parser do
      describe "to_text" do
        let(:string){"something"}
        let(:node){mock "node", :text => string}
        subject{Parser.to_string(node)}
        it "should get the text" do
          subject.should == "something"
        end
        context "where the string has whitespace" do
          let(:string){"\n\nsomething"}
          it "should strip the whitespace" do
            subject.should == "something"
          end
        end
      end
      describe "to_int" do
        let(:string){"2"}
        let(:node){mock "node", :text => string}
        subject{Parser.to_int(node)}
        it "should get the integer" do
          subject.should == 2
        end
        context "where the string has whitespace" do
          let(:string){"\n\n2"}
          it "should strip the whitespace" do
            subject.should == 2
          end
        end
        context "where the string is badly formatted" do
          context "where there is characters in the string" do
            let(:string){"fjkdsk"}
            it "should raise an error" do
              expect{subject}.to raise_error(InvalidFormat)
            end
          end
          context "where there are dots" do
            let(:string){"0.4"}
            it "should raise an error" do
              expect{subject}.to raise_error(InvalidFormat)
            end
          end
        end
      end
      describe "to_float" do
        let(:string){"22.50"}
        let(:node){mock "node", :text => string}
        subject{Parser.to_float(node)}
        it "should get the float" do
          subject.should == 22.50
        end
        context "where the string has whitespace" do
          let(:string){"\n\n22.59"}
          it "should strip the whitespace" do
            subject.should == 22.59
          end
        end
        context "where the string is badly formatted" do
          context "where there is characters in the string" do
            let(:string){"fjkdsk"}
            it "should raise an error" do
              expect{subject}.to raise_error(InvalidFormat)
            end
          end
          context "where there are multiple dots" do
            let(:string){"0.0.4"}
            it "should raise an error" do
              expect{subject}.to raise_error(InvalidFormat)
            end
          end
        end
      end
    end
  end
end
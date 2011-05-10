require 'spec_helper'

module Dozuki
  module Parsers

    describe String do
      describe ".parse" do
        let(:string){"something"}
        let(:node){mock "node", :text => string}
        subject{String.parse(node)}
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
    end

    describe Integer do
      describe ".parse" do
        let(:string){"2"}
        let(:node){mock "node", :text => string}
        subject{Integer.parse(node)}
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
              expect{subject}.to raise_error(InvalidFormat, "Cannot parse 'fjkdsk' to integer")
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

      describe Float do
        describe ".parse" do 
          let(:string){"22.50"}
          let(:node){mock "node", :text => string}
          subject{Float.parse(node)}
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
                expect{subject}.to raise_error(InvalidFormat, "Cannot parse 'fjkdsk' to float")
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

    describe Date do
      describe ".parse" do
        let(:string){"2011-01-03"}
        let(:node) { mock :node , :text => string }

        subject { Date.parse(node) }

        it{ should == ::Date.civil(2011, 1, 3)}

        context "where the string has whitespace" do
          let(:string){"\n\n2011-04-01"}
          it{ should == ::Date.civil(2011, 4, 1)}
        end
        context "where the string is not a valid date" do
          let(:string){ "dhjklfsjkfjkds" }
          specify { expect{ subject}.to raise_error(InvalidFormat)}
        end
      end
    end

    describe Boolean do
      let(:node) {mock :node, :text => string}
      subject{ Boolean.parse(node)}
      context "where string is 0" do
        let(:string){"0"}
        it{should be_false}
        context "and there is whitespace" do
          let(:string){"\n0"}
          it{should be_false}
        end
      end
      context "where string is 1" do
        let(:string){"1"}
        it{should be_true}
        context "and there is whitespace" do
          let(:string){"\n1"}
          it{should be_true}
        end
      end
      context "where string is true" do
        let(:string){ "true" }
        it {should be_true}
        context "and there is whitespace" do
          let(:string){"\ntrue"}
          it{should be_true}
        end
      end
      context "where string is false" do
        let(:string){ "false"}
        it{ should be_false }
      end
    end
  end
end

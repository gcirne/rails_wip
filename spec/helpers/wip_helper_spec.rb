require "spec_helper"

describe WipHelper do
  
  describe "#wip" do
  
    context "when rails env is test" do
      before do
        Rails.env.stub!(:test?).and_return(true)
        Rails.env.stub!(:development?).and_return(false)
      end

      it "should yield block" do
        yielded = false
        helper.wip {yielded = true}
        yielded.should be_true
      end
    end

    context "when rails env is development" do
      before do
        Rails.env.stub!(:test?).and_return(false)
        Rails.env.stub!(:development?).and_return(true)
      end

      it "should yield block" do
        yielded = false
        helper.wip {yielded = true}
        yielded.should be_true
      end
    end

    context "when rails env is something other than test and development" do
      before do
        Rails.env.stub!(:test?).and_return(false)
        Rails.env.stub!(:development?).and_return(false)
      end

      context "and query string doesn't have wip" do
        before {helper.stub!(:params).and_return({})}

        it "should not yield block" do
          yielded = false
          helper.wip {yielded = true}
          yielded.should be_false
        end
      end

      context "and query string has wip=false" do
        before {helper.stub!(:params).and_return(:wip => "false")}
        
        it "should not yield block" do
          yielded = false
          helper.wip {yielded = true}
          yielded.should be_false
        end
      end

      context "and query string has wip=true" do
        before {helper.stub!(:params).and_return(:wip => "true")}
        
        it "should yield block" do
          yielded = false
          helper.wip {yielded = true}
          yielded.should be_true
        end
      end
    end

  end

end

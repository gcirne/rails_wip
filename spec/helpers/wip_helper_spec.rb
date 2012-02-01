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

      it "should not yield block" do
        yielded = false
        helper.wip {yielded = true}
        yielded.should be_false
      end
    end
  end

end

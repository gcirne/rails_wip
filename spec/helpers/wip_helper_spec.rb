require "spec_helper"

describe WipHelper do
  
  describe "#wip" do
    context "when rails env is test" do
      it "should yield block" do
        yielded = false
        helper.wip {yielded = true}
        yielded.should be_true
      end
    end

    context "when rails env is something other than test" do
      before {Rails.env.stub!(:test?).and_return(false)}

      it "should not yield block" do
        yielded = false
        helper.wip {yielded = true}
        yielded.should be_false
      end
    end
  end

end

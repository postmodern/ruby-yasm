require 'yasm/version'

require 'spec_helper'

describe YASM do
  it "should have a VERSION constant" do
    YASM.const_defined?('VERSION').should == true
  end
end

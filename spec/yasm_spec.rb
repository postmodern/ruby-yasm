require 'yasm/version'

require 'spec_helper'

describe YASM do
  it "should have a VERSION constant" do
    expect(subject.const_defined?('VERSION')).to eq(true)
  end
end

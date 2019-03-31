require "test_helper"

describe Ethnicity do
  let(:ethnicity) { Ethnicity.new }

  it "must be valid" do
    value(ethnicity).must_be :valid?
  end
end

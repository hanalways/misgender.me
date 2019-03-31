require "test_helper"

describe Twitter do
  let(:twitter) { Twitter.new }

  it "must be valid" do
    value(twitter).must_be :valid?
  end
end

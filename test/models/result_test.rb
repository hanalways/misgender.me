require "test_helper"

describe Result do
  let(:result) { Result.new }

  it "must be valid" do
    value(result).must_be :valid?
  end
end

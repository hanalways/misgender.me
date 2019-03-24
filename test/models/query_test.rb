require "test_helper"

describe Query do
  let(:query) { Query.new }

  it "must be valid" do
    value(query).must_be :valid?
  end
end

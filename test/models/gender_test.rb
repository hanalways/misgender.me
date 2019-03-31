require "test_helper"

describe Gender do
  let(:gender) { Gender.new }

  it "must be valid" do
    value(gender).must_be :valid?
  end
end

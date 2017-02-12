require "test_helper"

describe Verse do
  let(:verse) { Verse.new }

  it "must be valid" do
    value(verse).must_be :valid?
  end
end

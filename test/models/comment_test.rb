require "test_helper"

describe Comment do
  let(:comment) { Comment.new }

  it "must be valid" do
    comment.must_be :valid?
  end
end

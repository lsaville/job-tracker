require 'rails_helper'

describe Comment do
  describe "validations" do
    context "valid attributes" do
      it "valid with content" do
        comment = Comment.new(content: "Here's some content in here")
        expect(comment).to be_valid
      end
    end

    context "invalid attributes" do
      it "is invalid without content" do
        comment = Comment.new
        expect(comment).to be_invalid
      end
    end
  end

  describe "relationships" do
    it "belongs to job" do
      comment = Comment.new(content: "Some bland content")
      expect(comment).to respond_to(:job)
    end
  end

end

require 'rails_helper'

describe Comment do
  describe "attributes" do
    it "has a content" do
      comment = create(:comment)

      expect(comment).to respond_to(:content)
    end
  end

  describe "relationships" do
    it "belongs to a job" do
      comment = create(:comment)

      expect(comment).to respond_to(:job)
    end
  end
end
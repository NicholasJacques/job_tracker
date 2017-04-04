require 'rails_helper'

describe Company do
  describe "attributes" do
    it "has a title" do
      category = create(:category)

      expect(category).to respond_to(:title)
    end

    it "has jobs" do
      category = create(:category)

      expect(category).to respond_to(:jobs)
    end
  end
end

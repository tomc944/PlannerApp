# body
# user_id
# private (T or F)
require 'rails_helper'

RSpec.describe Goal, type: :model do
  let(:new_goal) { Goal.create(body: "lose weight", user_id: 1, private: true) }
  let(:new_user) { User.create(username: "Gizmo", password: "Password") }

  describe "goal" do
    it "has a body" do
      expect(new_goal.body).to_not be_nil
    end
    
  end
end

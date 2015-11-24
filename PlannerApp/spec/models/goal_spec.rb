# body
# user_id
# privacy (T or F)
require 'rails_helper'

RSpec.describe Goal, type: :model do
  let(:new_goal) { Goal.create(body: "lose weight", user_id: 1, privacy: true) }
  let(:new_user) { User.create(username: "Gizmo", password: "Password") }

  describe "goal" do
    it "has a body" do
      expect(new_goal.body).to_not be_nil
    end

    # it "belongs to a user" do
    #   expect(new_goal.user.id).to be(1)
    # end
  end
end

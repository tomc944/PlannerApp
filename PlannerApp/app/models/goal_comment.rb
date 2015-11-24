class GoalComment < ActiveRecord::Base
  validates :goal_id, :body, presence: true

  belongs_to :goal
  belongs_to :user
end

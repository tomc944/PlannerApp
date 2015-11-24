class UserComment < ActiveRecord::Base
  validates :user_id, :body, presence: true

  belongs_to :user
  belongs_to :comment
end

class Reminder < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(completed: :asc, created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 200 }
end

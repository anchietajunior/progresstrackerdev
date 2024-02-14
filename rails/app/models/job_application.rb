class JobApplication < ApplicationRecord
  belongs_to :user
  has_many :interviews, dependent: :destroy

  enum status: { applied: 0, in_progress: 1, rejected: 2, declined: 3, offer_received: 4, paused: 5 }
  enum priority: { low: 0, medium: 1, height: 2 }
  enum avaliation: { bad: 0, regular: 1, good: 2, excellent: 3 }
end

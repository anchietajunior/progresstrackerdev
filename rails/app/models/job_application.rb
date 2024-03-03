# frozen_string_literal: true

class JobApplication < ApplicationRecord
  belongs_to :user
  has_many :interviews, dependent: :destroy

  validates :position, :status, :applied_at, :company_name, :location, presence: true

  enum status: { applied: 0, in_progress: 1, rejected: 2, declined: 3, offer_received: 4, paused: 5 }
  enum priority: { low: 0, medium: 1, high: 2 }
  enum avaliation: { bad: 0, regular: 1, good: 2, excellent: 3 }
end

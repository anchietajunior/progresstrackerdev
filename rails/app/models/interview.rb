class Interview < ApplicationRecord
  belongs_to :job_application

  enum interview_type: { first_contact: 0, hr: 1, technical_conversation: 2, live_coding: 3, home_assesment: 4 }
end

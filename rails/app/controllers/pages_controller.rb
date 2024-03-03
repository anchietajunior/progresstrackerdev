class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :redirect_if_authenticated, only: %i[home]

  def home; end

  def info
    @job_applications = current_user.job_applications.order(created_at: :desc).limit(3)
    @interviews = Interview.where(job_application_id: current_user.job_applications.pluck(:id))
      .where('interview_at > ?', Date.today).order(created_at: :desc).limit(3)
  end
end

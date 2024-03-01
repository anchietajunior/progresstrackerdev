class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :redirect_if_authenticated, only: %i[home]

  def home; end

  def info
    @job_applications = JobApplication.order(created_at: :desc).limit(3)
    @interviews = Interview.where('interview_at > ?', Date.today).order(created_at: :desc).limit(3)
  end
end

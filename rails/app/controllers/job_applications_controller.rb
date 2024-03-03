# frozen_string_literal: true

class JobApplicationsController < ApplicationController
  before_action :set_job_application, only: %i[show edit update destroy]

  def index
    @job_applications = current_user.job_applications.order(created_at: :desc)
  end

  def show
    @interviews = @job_application.interviews.order(interview_at: :desc)
  end

  def new
    @job_application = JobApplication.new
  end

  def edit; end

  def create
    @job_application = JobApplication.new(job_application_params)

    respond_to do |format|
      if @job_application.save
        format.html do
          redirect_to job_application_url(@job_application), notice: 'Job application was successfully created.'
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @job_application.update(job_application_params)
        format.html do
          redirect_to job_application_url(@job_application), notice: 'Job application was successfully updated.'
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @job_application.destroy!

    respond_to do |format|
      format.html { redirect_to job_applications_url, notice: 'Job application was successfully destroyed.' }
    end
  end

  private

  def set_job_application
    @job_application = JobApplication.find(params[:id])
  end

  def job_application_params
    params.require(:job_application).permit(
      :company_name,
      :position, :status,
      :applied_at,
      :applied_via,
      :contact_name,
      :contact_email,
      :priority,
      :location,
      :personal_feedback,
      :avaliation
    ).merge(user: current_user)
  end
end

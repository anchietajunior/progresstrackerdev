class InterviewsController < ApplicationController
  before_action :set_job_application
  before_action :set_interview, only: %i[show edit update destroy]

  def show; end

  def new
    @interview = @job_application.interviews.build
  end

  def edit; end

  def create
    @interview = @job_application.interviews.build(interview_params)

    respond_to do |format|
      if @interview.save
        @job_application.interviews.reload

        format.html do
          redirect_to job_application_path(@job_application), notice: 'Interview was successfully created.'
        end
        format.json { render :show, status: :created, location: @interview }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @interview.update(interview_params)
        format.html do
          redirect_to job_application_url(@job_application), notice: 'Interview was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @interview }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @interview.destroy!

    respond_to do |format|
      format.html { redirect_to job_application_url(@job_application), notice: 'Interview was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_job_application
    @job_application = current_user.job_applications.find(params[:job_application_id])
  end

  def set_interview
    @interview = Interview.find(params[:id])
  end

  def interview_params
    params.require(:interview).permit(:interview_at, :interview_type, :details, :interviewers_info, :url)
  end
end

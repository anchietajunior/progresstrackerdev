require "test_helper"

class InterviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    log_in(users(:anchieta))
    @interview = interviews(:one)
  end

  test "should get new" do
    get new_job_application_interview_url(@interview.job_application_id)
    assert_response :success
  end

  test "should create interview" do
    assert_difference("Interview.count") do
      post job_application_interviews_url(@interview.job_application), params: { interview: { details: @interview.details, interview_at: @interview.interview_at, interview_type: @interview.interview_type, interviewers_info: @interview.interviewers_info, url: @interview.url } }
    end

    assert_redirected_to job_application_interview_url(Interview.last.job_application_id, Interview.last)
  end

  test "should show interview" do
    get job_application_interview_url(@interview.job_application, @interview)
    assert_response :success
  end

  test "should get edit" do
    get edit_job_application_interview_url(@interview.job_application, @interview)
    assert_response :success
  end

  test "should update interview" do
    patch job_application_interview_url(@interview.job_application, @interview), params: { interview: { details: @interview.details, interview_at: @interview.interview_at, interview_type: @interview.interview_type, interviewers_info: @interview.interviewers_info, url: @interview.url } }
    assert_redirected_to job_application_interview_url(@interview.job_application, @interview)
  end

  test "should destroy interview" do
    assert_difference("Interview.count", -1) do
      delete job_application_interview_url(@interview.job_application, @interview)
    end

    assert_redirected_to job_application_url(@interview.job_application)
  end
end
